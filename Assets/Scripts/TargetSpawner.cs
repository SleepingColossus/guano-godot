using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetSpawner : MonoBehaviour
{
    public GameObject[] prefabs;
    public float delay = 2.0f;
    public bool active = true;

    void Start()
    {
        StartCoroutine(TargetGenerator());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private IEnumerator TargetGenerator()
    {
        yield return new WaitForSeconds(delay);

        if (active)
        {
            var prefab = prefabs[Random.Range(0, prefabs.Length)];
            var newTrasform = transform;

            Instantiate(prefab, newTrasform.position, Quaternion.identity);
        }

        StartCoroutine(TargetGenerator());
    }
}
