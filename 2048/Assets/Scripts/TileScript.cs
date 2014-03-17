using UnityEngine;
using System.Collections;

public class TileScript : MonoBehaviour {

	public int whichTile;
	private grid g;
	private SpriteRenderer s;
	// Use this for initialization
	void Start () {
		g = GameMaster.getGrid();
		s = GetComponent<SpriteRenderer>();
	}
	
	// Update is called once per frame
	void Update () {
		int value = g.gridGet(whichTile % g.grid_size,whichTile / g.grid_size);
		GameObject go;
		s.enabled = true;
		switch (value)
		{
		case 0:
			s.enabled = false;
			break;
		case 2:
			go = GameObject.Find("2");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 4:
			go = GameObject.Find("4");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 8:
			go = GameObject.Find("8");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 16:
			go = GameObject.Find("16");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 32:
			go = GameObject.Find("32");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 64:
			go = GameObject.Find("64");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;
		case 128:
			go = GameObject.Find("128");
			s.sprite = go.GetComponent<SpriteRenderer>().sprite;
			break;

		}
	}
}
