using UnityEngine;
using System.Collections;

public class GameMaster : MonoBehaviour {

	static private grid g = new grid();
	private bool gameOver = false;
	private IVictory victoryCondition;
	// Use this for initialization
	void Start () {
		//printGrid();
		victoryCondition = new VictoryOnEight();
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (gameOver)
		{
			return;
		}

		if (victoryCondition.checkVictory(g))
		{
			gameOver = true;
			print("You Win");
		}

		if (g.can_move() == false)
		{
			print ("You Lose");
		}
		else
		{
			if (Input.GetButtonDown("Down"))
			{
				g.makeAction(grid.direction.SOUTH);
				//printGrid();
			}

			if (Input.GetButtonDown("Up"))
			{
				g.makeAction(grid.direction.NORTH);
				//printGrid();
			}

			if (Input.GetButtonDown("Left"))
			{
				g.makeAction(grid.direction.WEST);
				//printGrid();
			}

			if (Input.GetButtonDown("Right"))
			{
				g.makeAction(grid.direction.EAST);
				//printGrid();
			}
		}
	}

	public void printGrid()
	{
		string s = "";
		for(int y = 0; y < g.grid_size; ++y)
		{
			for(int x = 0; x < g.grid_size; ++x)
			{
				s += g.m_grid[y,x].ToString() + "\t";
			}
			s += "\n";
		}
		print (s);
		s = "";
	}

	public static grid getGrid()
	{
		return g;
	}
}
