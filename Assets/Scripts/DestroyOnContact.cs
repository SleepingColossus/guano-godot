using System;
using UnityEngine;

public class DestroyOnContact : MonoBehaviour
{
    private void OnTriggerEnter2D(Collider2D other)
    {
        var reward = other.GetComponent<Reward>();

        // find better solution
        var gameState = GameObject.Find("GameState").GetComponent<GameState>();
        gameState.UpdateScore(reward.pointsAwarded);
        gameState.UpdateAmmo(reward.ammoAwarded);

        other.GetComponent<MovingTarget>().Die();
        Destroy(gameObject);
    }
}
