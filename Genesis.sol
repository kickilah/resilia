// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

/// @title Genesis — This is the immutable founding record of Adaptive Resilience Action
/// @author Adi
/// @notice This contract has no owner, no admin, and no withdrawal function.
///         It exists as a permanent, irrevocable founding act on Ethereum.
/// @dev All state is set in the constructor. No state-changing functions exist.

contract Genesis {

    // ── Founding Identity ──────────────────────────────────────────────

    string private constant NAME = "Adaptive Resilience Action";

    string private constant MISSION =
        "(a) Relief of hardship through proactive financial protection and rapid recovery funding "
        "to communities facing natural disasters, conflict, and catastrophic shocks. "
        "(b) Building the institutional capacity of frontline organisations to design and sustain "
        "their own resilience programmes. "
        "(c) Advancing public knowledge of disaster risk, systemic resilience, and the financial "
        "tools that turn vulnerability into preparedness. "
        "(d) Research into new models for catastrophic risk transfer and sharing every finding "
        "openly, for the benefit of all.";

    // 23 March 2026, 11:27:57 AM SGT (UTC+8 = 03:27:57 UTC)
    uint256 private constant BIRTH_TIME = 1774236477;

    // ── State (set once in constructor, never modified) ────────────────

    uint256 private immutable _confirmedBirthTime;
    uint256 private immutable _seedAmount;

    // ── Birth Event ───────────────────────────────────────────────────

    event Born(
        string name,
        uint256 birthTime,
        uint256 confirmedBirthTime,
        uint256 seedAmount
    );

    // ── Constructor (the only state-changing moment) ──────────────────

    constructor() payable {
        _confirmedBirthTime = block.timestamp;
        _seedAmount = msg.value;

        emit Born(
            NAME,
            BIRTH_TIME,
            block.timestamp,
            msg.value
        );
    }

    // ── View Functions (the contract speaks) ──────────────────────────

    /// @notice What is this entity?
    function name() external pure returns (string memory) {
        return NAME;
    }

    /// @notice Why does this entity exist?
    function mission() external pure returns (string memory) {
        return MISSION;
    }

    /// @notice When was this entity born?
    function birthTime() external view returns (
        uint256 birth,
        uint256 confirmedOnChain
    ) {
        return (BIRTH_TIME, _confirmedBirthTime);
    }

    /// @notice How much was irrevocably sealed at founding?
    function seedOffering() external view returns (uint256) {
        return _seedAmount;
    }

    /// @notice Tell me about this entity.
    function about() external view returns (
        string memory entityName,
        string memory entityMission,
        uint256 birth,
        uint256 confirmedOnChain,
        uint256 seed
    ) {
        return (
            NAME,
            MISSION,
            BIRTH_TIME,
            _confirmedBirthTime,
            _seedAmount
        );
    }
}
