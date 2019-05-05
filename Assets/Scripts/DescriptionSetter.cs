using System;
using UnityEngine;
using UnityEngine.UI;

public class DescriptionSetter : MonoBehaviour
{
    public DescriptionType descriptionType;
    public Reward reward;
    private Text _descriptionText;

    private void Start()
    {
        _descriptionText = GetComponent<Text>();
        var amount = descriptionType == DescriptionType.Ammo ? reward.ammoAwarded : reward.pointsAwarded; 
        var resource = descriptionType == DescriptionType.Ammo ? "ammo" : "points";

        _descriptionText.text = $"Awards {amount} {resource}";
    }
}
