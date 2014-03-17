using System;
using System.Collections.Generic;

public class grid
{
	// How large to make the grid
	public int grid_size = 4;
	
	// Seed
	public int seed = 1;
	
	// What value to set the first tile as
	public int initial_value = 2;
	
	// How many tiles should have values at the start
	public int initial_slot_count = 2;
	
	// How many empty slots get a value after every turn
	public int round_slot_count = 1;

	private int action_count = 4;

	public int[,] m_grid = new int[4,4];

	private Random randomer = new Random();

	public enum direction
	{
		NORTH = 0,
		SOUTH,
		EAST,
		WEST
	};

	//List<direction> m_actions;


	
	public void reset()
	{
		for(int x = 0; x < grid_size; ++x)
		{
			for(int y = 0; y < grid_size; ++y)
			{
				m_grid[y,x] = 0;
			}
		}
	}

	private bool has_empty()
	{
		for(int x = 0; x < grid_size; ++x)
		{
			for(int y = 0; y < grid_size; ++y)
			{
				if(m_grid[y,x] == 0)
				{
					return true;
				}
			}
		}
		
		return false;
	}

	private void random_empty_pos(ref int x,ref int y)
	{
		if(!has_empty())
		{
			return;
		}
		
		do
		{
			x = rand_pos();
			y = rand_pos();
		}
		while(m_grid[y,x] != 0);
	}

	public void init(int count)
	{
		for(int i = 0; i < count; ++i)
		{
			int x = -1;
			int y = -1;
			
			random_empty_pos(ref x, ref y);
			
			if(x == -1 && y == -1)
			{
				return;
			}
			
			m_grid[y,x] = initial_value;
		}
	}
	// Gives a random position from [0, grid_size)
	private int rand_pos()
	{
		return randomer.Next() % grid_size;
	}
	
	// Gives a random action from [0, action_count)
	private direction rand_action()
	{
		return (direction)(randomer.Next() % action_count);
	}

	private bool is_outside(int x, int y)
	{
		return (x < 0 || x >= grid_size || y < 0 || y >= grid_size);
	}

	private bool merge(direction dir)
	{
		bool merging = false;
		
		if(dir == direction.SOUTH)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = grid_size - 1; y >= 0; --y)
				{
					// Empty slots dont merge
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int nextY = y + 1;
					int value = m_grid[y,x];
					int merge_value = gridGet(x, nextY);
					
					if(value == merge_value)
					{
						m_grid[y,x] = 0;
						m_grid[nextY,x] = value + value;
						
						merging = true;
					}
				}
			}
			
			return merging;
		}
		if(dir == direction.NORTH)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont merge
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int nextY = y - 1;
					int value = m_grid[y,x];
					int merge_value = gridGet(x, nextY);
					
					if(value == merge_value)
					{
						m_grid[y,x] = 0;
						m_grid[nextY,x] = value + value;
						
						merging = true;
					}
				}
			}
			
			return merging;
		}
		if(dir == direction.WEST)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont merge
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int nextX = x - 1;
					int value = m_grid[y,x];
					int merge_value = gridGet(nextX, y);
					
					if(value == merge_value)
					{
						m_grid[y,x] = 0;
						m_grid[y,nextX] = value + value;
						
						merging = true;
					}
				}
			}
			
			return merging;
		}
		if(dir == direction.EAST)
		{
			for(int x = grid_size - 1; x >= 0; --x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont merge
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int nextX = x + 1;
					int value = m_grid[y,x];
					int merge_value = gridGet(nextX, y);
					
					if(value == merge_value)
					{
						m_grid[y,x] = 0;
						m_grid[y,nextX] = value + value;
						
						merging = true;
					}
				}
			}
			
			return merging;
		}
		
		return merging;
	}

	public void makeAction(direction dir)
	{
		bool a = move(dir);
		bool b = merge(dir);
		bool c = move(dir);
		
		if(a || b || c)
		{
			init(round_slot_count);
		}

		//m_actions.Add(dir); // not too sure what this is for
	}

	public int gridGet(int x, int y)
	{
		if(is_outside(x, y))
		{
			return -1;
		}
		
		return m_grid[y,x];
	}

	public void gridSet(int x, int y, int value)
	{
		if(is_outside(x, y))
		{
			return;
		}
		
		m_grid[y,x] = value;
	}

	public int score()
	{
		int total = 0;
		for(int x = 0; x < grid_size; ++x)
		{
			for(int y = 0; y < grid_size; ++y)
			{
				total += m_grid[y,x];
			}
		}
		
		return total;
	}

	public int largest()
	{
		int num = 0;
		for(int x = 0; x < grid_size; ++x)
		{
			for(int y = 0; y < grid_size; ++y)
			{
				int value = m_grid[y,x];
				if(value > num)
				{
					num = value;
				}
			}
		}
		
		return num;
	}

	public int size()
	{
		return grid_size;
	}

	public bool move(direction dir)
	{
		bool movement = false;
		
		if(dir == direction.SOUTH)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = grid_size - 1; y >= 0; --y)
				{
					// Empty slots dont move
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int newY = y;
					int nextY = y + 1;
					
					while(!is_outside(x, nextY) && m_grid[nextY,x] == 0)
					{
						newY = nextY;
						
						++nextY;
					}
					
					if(newY != y)
					{
						movement = true;
					}
					
					int value = m_grid[y,x];
					
					m_grid[y,x] = 0;
					m_grid[newY,x] = value;
				}
			}
		}
		if(dir == direction.NORTH)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont move
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int newY = y;
					int nextY = y - 1;
					
					while(!is_outside(x, nextY) && m_grid[nextY,x] == 0)
					{
						newY = nextY;
						
						--nextY;
					}
					
					if(newY != y)
					{
						movement = true;
					}
					
					int value = m_grid[y,x];
					
					m_grid[y,x] = 0;
					m_grid[newY,x] = value;
				}
			}
		}
		if(dir == direction.WEST)
		{
			for(int x = 0; x < grid_size; ++x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont move
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int newX = x;
					int nextX = x - 1;
					
					while(!is_outside(nextX, y) && m_grid[y,nextX] == 0)
					{
						newX = nextX;
						
						--nextX;
					}
					
					if(newX != x)
					{
						movement = true;
					}
					
					int value = m_grid[y,x];
					
					m_grid[y,x] = 0;
					m_grid[y,newX] = value;
				}
			}
		}
		if(dir == direction.EAST)
		{
			for(int x = grid_size - 1; x >= 0; --x)
			{
				for(int y = 0; y < grid_size; ++y)
				{
					// Empty slots dont move
					if(m_grid[y,x] == 0)
					{
						continue;
					}
					
					int newX = x;
					int nextX = x + 1;
					
					while(!is_outside(nextX, y) && m_grid[y,nextX] == 0)
					{
						newX = nextX;
						
						++nextX;
					}
					
					if(newX != x)
					{
						movement = true;
					}
					
					int value = m_grid[y,x];
					
					m_grid[y,x] = 0;
					m_grid[y,newX] = value;
				}
			}
		}
		
		return movement;
	}

	public bool can_move()
	{
		for(int x = 0; x < grid_size; ++x)
		{
			for(int y = 0; y < grid_size; ++y)
			{
				// Only need 1 empty space to move
				if(m_grid[y,x] == 0)
				{
					return true;
				}
				
				// Neighbor check
				int value = m_grid[y,x];
				
				int north = gridGet(x, y - 1);
				if(value == north)
				{
					return true;
				}
				
				int south = gridGet(x, y + 1);
				if(value == south)
				{
					return true;
				}
				
				int east = gridGet(x - 1, y);
				if(value == east)
				{
					return true;
				}
				
				int west = gridGet(x + 1, y);
				if(value == west)
				{
					return true;
				}
			}
		}
		return false;
	}

	private void add_actions(ref List<direction> actions)
	{
		foreach (direction a in actions)
		{
			makeAction(a);
		}
	}

	public grid ()
	{
		reset();
		init(initial_slot_count);
	}
}

