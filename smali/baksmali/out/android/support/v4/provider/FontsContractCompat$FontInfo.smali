.class public Landroid/support/v4/provider/FontsContractCompat$FontInfo;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/provider/FontsContractCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FontInfo"
.end annotation


# instance fields
.field private final mItalic:Z

.field private final mResultCode:I

.field private final mTtcIndex:I

.field private final mUri:Landroid/net/Uri;

.field private final mWeight:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;IIZI)V
    .registers 6
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x3e8L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iput-object p1, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mUri:Landroid/net/Uri;

    iput p2, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mTtcIndex:I

    iput p3, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mWeight:I

    iput-boolean p4, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mItalic:Z

    iput p5, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mResultCode:I

    return-void
.end method


# virtual methods
.method public getResultCode()I
    .registers 2

    iget v0, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mResultCode:I

    return v0
.end method

.method public getTtcIndex()I
    .registers 2
    .annotation build Landroid/support/annotation/IntRange;
        from = 0x0L
    .end annotation

    iget v0, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mTtcIndex:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getWeight()I
    .registers 2
    .annotation build Landroid/support/annotation/IntRange;
        from = 0x1L
        to = 0x3e8L
    .end annotation

    iget v0, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mWeight:I

    return v0
.end method

.method public isItalic()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/provider/FontsContractCompat$FontInfo;->mItalic:Z

    return v0
.end method
