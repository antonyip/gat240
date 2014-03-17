using System;

public interface IVictory
{
	bool checkVictory(grid g);
	// level 1
	// get a block to 64 (moves unlimited)
	// level 2
	// get a block to 256 (moves unlimited)
	// level 3
	// get a block to 512 (moves unlimited)
	// level 4
	// have 3 blocks at 64 (moves unlimited)
	// level 5
	// get a block to 1024 (moves unlimited)

	// level 6
	// get a block to 64 (30 moves)
	// level 7
	// get a block to 256 (100 moves)
	// level 8
	// get a block to 512 (300 moves)
	// level 9
	// get 2 blocks to 512 (700 moves)
	// level 10
	// get a block to 1024 (600 moves)

	// level 11
	// get a block to 128 (50 moves) (1 blocking tile)
	// level 12
	// get a block to 1024 (700 moves) (1 blocking tile)
	// level 13 
	// get a block to 1024 (2000 moves) (prefixed starting)
	// level 14
	// get a block to 1024 (2000 moves) (5x5 grid)
	// level 15
	// get a block to 1024 (1500 moves) (5x5 grid) (blocking tile)

	
}



