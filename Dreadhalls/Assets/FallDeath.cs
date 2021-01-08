using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class FallDeath : MonoBehaviour {

	public int fallDistance = -15;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if (gameObject.transform.position.y < fallDistance){
			LevelCount.levelCounter = 1;
			SceneManager.LoadScene("Endgame");
		}
	}
}
