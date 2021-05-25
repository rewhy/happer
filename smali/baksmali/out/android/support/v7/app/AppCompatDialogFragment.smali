.class public Landroid/support/v7/app/AppCompatDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AppCompatDialogFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    new-instance p1, Landroid/support/v7/app/AppCompatDialog;

    invoke-virtual {p0}, Landroid/support/v7/app/AppCompatDialogFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/app/AppCompatDialogFragment;->getTheme()I

    move-result v1

    invoke-direct {p1, v0, v1}, Landroid/support/v7/app/AppCompatDialog;-><init>(Landroid/content/Context;I)V

    return-object p1
.end method

.method public setupDialog(Landroid/app/Dialog;I)V
    .registers 4
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    instance-of v0, p1, Landroid/support/v7/app/AppCompatDialog;

    if-eqz v0, :cond_19

    move-object v0, p1

    check-cast v0, Landroid/support/v7/app/AppCompatDialog;

    packed-switch p2, :pswitch_data_1e

    goto :goto_1c

    :pswitch_b
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x18

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    :pswitch_14
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDialog;->supportRequestWindowFeature(I)Z

    goto :goto_1c

    :cond_19
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->setupDialog(Landroid/app/Dialog;I)V

    :goto_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_14
        :pswitch_14
        :pswitch_b
    .end packed-switch
.end method
