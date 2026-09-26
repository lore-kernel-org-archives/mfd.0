Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AF38F638;
	Sat, 26 Sep 2026 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447122; cv=none; b=kZHQTMF6CF+DKa7k2CpXeSFq8H549P/eClosQV0bxJBYMLpEWi2bOseuiaGuiBqB6qLggwBqkZgsmunQOZJs7ChGpMlxlRJOlmtAYucbEXrqJhTLry6uDcsB79bF6J60Bj7vZiaDm+vl667QexICXv0U9JaNbQ2AobOrDYR+W5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447122; c=relaxed/simple;
	bh=e1nG5uDABUAYLAnathPwPw21CLNj4OVUxFtx8n8MhUQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NzAbMdJBpdZOX4LRtVYXUkNFxBQ1sxAZAYpgOdOuvuQCzTHPCjK6dV3UvCL6lXBF9LJBJ3hv7l1NCdv2E4gmOVaSt7UZoXRxZy9UL1TD296VONAwkNwYZqA2ku93lexTQ5F/lz4Hk71JayIe8sh+TwVF7jwXFYiaopcQ/aExRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBRP2sE0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBRP2sE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BC61F00898;
	Sat, 26 Sep 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447121;
	bh=4zW0dKWKf7G2tG4jteQ0vH7n7FK453EFT9m7Rn5hKII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BBRP2sE0AaZTXKePeQtP2+JzW9qQa75LSegTzcFvIx+ctsMLKQsjzqZwUOmCueu1r
	 DY49+viaaRUl5M8bpWxZepW/6otIbyxpiEBkKj3C7WWW7NrY+1RHGVycfa3mnoirj3
	 9g+1zPY1qB3sXNCboLvBfjP0uhF5GkL1yD01jexRl8Vrhl8/DGErtleLY+4ArK7Stv
	 Vcl+1uiWKxgf3btMe3ZHPvaMvhgAENCgYyCxosT/BB6zpmEI8vIYMBC9DUu9qmL5Op
	 ikXCLSYScJtbj5lmxzSBD8U4OoQTv/7+EW1IXFC6v3IHuKuITbd6K6SGZbS2ft2l5O
	 ydff2wrha441g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 6/9] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260925182435.21207-7-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:20 +0000
Message-Id: <20260926182520.D3BC61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: missing DSA_TAG_PROTO_AIROHA support in Mediatek/Airoha =
ethernet drivers
--

commit 3da7d110875eb668c591fb8186046c81cef009ee
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: tag_mtk: add Airoha variant usage of this TAG

Add variant of the MTK TAG for Airoha Switch and comments about difference
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
Does adding this new protocol variant break Ethernet drivers that explicitly
check for DSA_TAG_PROTO_MTK?

For example, in drivers/net/ethernet/airoha/airoha_eth.c:airoha_get_dsa_tag=
(),
failing to recognize the Airoha DSA protocol prevents extracting the tag for
hardware DMA descriptors, breaking transmission:

	if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return 0;

Similarly, does this break PPE L2 flow offload in
drivers/net/ethernet/mediatek/mtk_ppe.c:mtk_ppe_check_skb() because it
rejects the Airoha protocol variant?

	if (!netdev_uses_dsa(skb->dev) ||
		    skb->dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)

And in drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_flow_get_dsa_por=
t(),
will flow offloads targeting Airoha DSA ports fail or misroute?

	if (dp->cpu_dp->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return -ENODEV;

Finally, in drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_uses_dsa(), doe=
s it
disable GDMA hardware special tag parsing when an Airoha switch is connecte=
d?

	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto =3D=3D DSA_TAG_PROTO_MTK;

>  	DSA_TAG_PROTO_QCA		=3D DSA_TAG_PROTO_QCA_VALUE,
>  	DSA_TAG_PROTO_TRAILER		=3D DSA_TAG_PROTO_TRAILER_VALUE,
>  	DSA_TAG_PROTO_8021Q		=3D DSA_TAG_PROTO_8021Q_VALUE,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D6
