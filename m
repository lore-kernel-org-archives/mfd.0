Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5649F35C19B;
	Tue, 29 Sep 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711556; cv=none; b=Z0OSH/1aPewXU/gyoQaRvtQRaNIMsZtsyuIAjAZt3EyM5hMdMDwf90tw8tCXnjguisz42lv8gt3f0Tw/7crncXxCiYh3qFTgg5XGGsipAhDrOXQtfC8Rj8NHDpRo2p8ketTAb37g2wzsul9sGHxOhbCQloJkHae7GGiUliumuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711556; c=relaxed/simple;
	bh=lNCqn39gOROp7EYBtvFc5RIrKgwDQr3wWoNUzpHcqwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RvTyr010vFSjzt67nOVesPUvnSqamSfHw5LlallEmE17GoiqjsfqSqvzGUCH+QuPiE711pbxnTOSvPvGRrLlaAAKugf7hrpjzfmtkM6yv6keQOpSp0kWPYeagBtC8arSNcRzPq8N89a9EQPNPRluqAfi7QpD3WrComILcJlYe0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmgOmXBU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmgOmXBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC95C1F00893;
	Tue, 29 Sep 2026 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711555;
	bh=/4tJMhkAP6XLuOYIGEfQ0KhVWpX171WBdGTgtKXkuqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmgOmXBU8AeHoFGSnX85gONW9pV/Al+rezJltwIXMnBTzoMp/xUGHBcF6eeu11/GD
	 162XwehByjp2aSJ/BndYf+I+tyUDA8JVZWQ29JDehZaWXoL77W9Ez7s0+ZukyO32X0
	 LoMcc8X8R5Gn1iPp9IDqKxcX6np1Zb0SBeir4hUAYk5xCqg80gFqg91a2X4MN/DF/N
	 qzlpWA68SXEvbQZ0V78I6e3I8w6pToEtKkR6xYmZ6jcTg7/SuPkofUevLq2QlbeODF
	 blEdrlwf7ViwtTQ3QTWqOsY8EOMWUeaPkd2UxdApHIwf8CeJ0szvySWPwOVVpSVzD1
	 CE3d+htOhZuSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 06/10] net: dsa: tag_mtk: add Airoha
 variant usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260928194511.41878-7-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:34 +0000
Message-Id: <20260929195234.DC95C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: MAC driver offloads fail for new Airoha tag protocol
--

commit 8cdc1e6c2d15d8ca09e78024f7070167218dff24
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: dsa: tag_mtk: add Airoha variant usage of this TAG
   =20
    Add variant of the MTK TAG for Airoha Switch and comments about differe=
nce
    between Airoha AN8855 and Mediatek tag bitmap.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 5d12191b6f6f5..9824c63ad50b3 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -76,6 +77,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		=3D DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		=3D DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		=3D DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		=3D DSA_TAG_PROTO_AIROHA_VALUE,

[Severity: High]
Does this new protocol ID break hardware offloading and DMA descriptor
construction in existing drivers?

Several MAC drivers currently hardcode checks for DSA_TAG_PROTO_MTK and will
silently fail or reject this new protocol.

In the Airoha Ethernet driver, returning 0 breaks DMA descriptor constructi=
on:

drivers/net/ethernet/airoha/airoha_eth.c:airoha_get_dsa_tag() {
	if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return 0;
}

In the Mediatek Ethernet driver, metadata allocation for hardware forwarding
fails because mtk_uses_dsa() returns false:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_uses_dsa() {
	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto =3D=3D DSA_TAG_PROTO_MTK;
}

PPE hardware offloading silently aborts instead of forwarding:

drivers/net/ethernet/mediatek/mtk_ppe.c:mtk_foe_entry_prepare() {
	if (!netdev_uses_dsa(skb->dev) ||
	    skb->dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		goto out;
}

And flow offloading completely fails:

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_flow_get_dsa_port() {
	if (dp->cpu_dp->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return -ENODEV;
}

Do these drivers need to be updated to also accept DSA_TAG_PROTO_AIROHA?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D6
