using System;
using UnityEngine;

public class DestroyOnContact : MonoBehaviour
{
    private void OnTriggerEnter2D(Collider2D other)
    {
        var points = other.GetComponent<Reward>().pointsAwarded;

        // find better solution
        var gameState = GameObject.Find("GameState").GetComponent<GameState>();
        gameState.UpdateScore(points);
        
        other.GetComponent<MovingTarget>().Die();
        Destroy(gameObject);
    }
}
