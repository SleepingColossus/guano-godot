using System;
using UnityEngine;

public class ProjectileSpawner : MonoBehaviour
{
    public GameObject projectilePrefab;
    public GameState gameState;

    private void Update()
    {
        if (Input.anyKeyDown && gameState.ammo > 0)
        {
            gameState.UpdateAmmo(-1);
            Spawn();
        }
    }

    public void Spawn()
    {
        Instantiate(projectilePrefab, transform.position, Quaternion.identity);
    }
}
