// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.Analysis;

page 685 "Payment Periods"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Payment Periods';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Payment Period";
    SourceTableView = sorting("Days From");
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies code of the payment period.';
                }
                field("Days From"; Rec."Days From")
                {
                    ToolTip = 'Specifies the lowest number of "Actual Payment Days" for the payment to be included in the period.';
                }
                field("Days To"; Rec."Days To")
                {
                    ToolTip = 'Specifies the highest number of "Actual Payment Days" for the payment to be included in the period. 0 means no upper limit.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the description of the payment period.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RestoreDefaultPeriods)
            {
                ApplicationArea = All;
                Caption = 'Restore Default Periods';
                Image = Refresh;
                ToolTip = 'Recreates the default payment period buckets when no periods exist yet.';
                trigger OnAction()
                var
                    PaymentPeriod: Record "Payment Period";
                begin
                    if not PaymentPeriod.IsEmpty() then
                        if not Confirm(RestoreDefaultPeriodsQst) then
                            exit;

                    PaymentPeriod.DeleteAll();
                    PaymentPeriod.SetupDefaults();
                end;
            }
        }
    }

    var
        RestoreDefaultPeriodsQst: Label 'Existing payment periods will be deleted and replaced with defaults. Continue?';
}

