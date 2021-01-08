using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelCount : MonoBehaviour {

	public static int levelCounter = 1;
	public Text level ;

	// Use this for initialization
	void Start () {
		level.text = "Level: " + levelCounter;
	}
	
	// Update is called once per frame
	void Update () {
	}
}
