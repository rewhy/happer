.class Landroid/support/v7/widget/AppCompatHintHelper;
.super Ljava/lang/Object;
.source "AppCompatHintHelper.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static onCreateInputConnection(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;Landroid/view/View;)Landroid/view/inputmethod/InputConnection;
    .registers 4

    if-eqz p0, :cond_20

    iget-object v0, p1, Landroid/view/inputmethod/EditorInfo;->hintText:Ljava/lang/CharSequence;

    if-nez v0, :cond_20

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    :goto_a
    instance-of v0, p2, Landroid/view/View;

    if-eqz v0, :cond_20

    instance-of v0, p2, Landroid/support/v7/widget/WithHint;

    if-eqz v0, :cond_1b

    check-cast p2, Landroid/support/v7/widget/WithHint;

    invoke-interface {p2}, Landroid/support/v7/widget/WithHint;->getHint()Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p1, Landroid/view/inputmethod/EditorInfo;->hintText:Ljava/lang/CharSequence;

    goto :goto_20

    :cond_1b
    invoke-interface {p2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    goto :goto_a

    :cond_20
    :goto_20
    return-object p0
.end method
