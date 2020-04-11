.class final Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;
.super Ljava/security/Provider;
.source "PseudoSecureRandom.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lno/tghack/gaiainvaders/PseudoSecureRandom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PseudoSecureRandomProvider"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;",
        "Ljava/security/Provider;",
        "()V",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    const-string v0, "PseudoSecureRandom"

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const-string v3, "Deterministic PRNG"

    .line 48
    invoke-direct {p0, v0, v1, v2, v3}, Ljava/security/Provider;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final bridge entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;->getEntries()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge getEntries()Ljava/util/Set;
    .locals 1

    .line 47
    invoke-super {p0}, Ljava/security/Provider;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge getKeys()Ljava/util/Set;
    .locals 1

    .line 47
    invoke-super {p0}, Ljava/security/Provider;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge getSize()I
    .locals 1

    .line 47
    invoke-super {p0}, Ljava/security/Provider;->size()I

    move-result v0

    return v0
.end method

.method public bridge getValues()Ljava/util/Collection;
    .locals 1

    .line 47
    invoke-super {p0}, Ljava/security/Provider;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public final bridge keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;->getKeys()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public final bridge size()I
    .locals 1

    .line 47
    invoke-virtual {p0}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;->getSize()I

    move-result v0

    return v0
.end method

.method public final bridge values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lno/tghack/gaiainvaders/PseudoSecureRandom$PseudoSecureRandomProvider;->getValues()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
