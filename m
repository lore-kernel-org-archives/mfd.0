Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336078;
	b=iZPa5wRmS0SwKYb3Kce5GowsUF/tL3HdzLo90s/8qwxLIvxbuEJvdL4XGh2VFact+7zE
	 0n2tCE7TXxs06LCDXYjOGFmrZl43iOq0ZxPIANNUEK8UYp+yK82geHhX107OAEjNo60ib
	 ktaMeHpv+5K7MZwqd5yjGnkjL0ixxXQJ61E2K8fzyLgFO604xjj+jc1Yb98lGhbgkek81
	 7WO9p3rr1cNl/tU/mN2morQNCGVwJvWOkaWtUiM5o1puoXcuJHrqXL4iV0Vb0rFiP0hL6
	 /6G0h2+aNXpeEKhWJBvqo2YPL3ZlJ4OwvPEUF9j7ozO6OSsXTWVV+zDj/YkDrbNzttA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cpVmLAkXUEKk1gtTsJfO0NQgZBTsyiKIKho12225nQ8=;
	b=Y5geSVbpqkVS44KfopBX1SNjCNh3opjn9kDws5jrTznTNKkP8+XeECKf9GVWI8oQJefA
	 SSFlRXehPPdf5kQRFXPv0HjwPjYkIQ34LBrXT3sux/zHytEEuF4iiZHV6rVT3NzKtkwkT
	 nM1AqhqndCTyTfMPZqq07KE/WbcBdDFd58MchQvmle9Z3CaWrKhvS+ySAjbMgp3ZtyAWY
	 vLkF7jGK24+wsnx7Ka0Lczef5QygGGN6D9NrXrZxOKbaPPNX0cVUdY7gUF3GVCOLWoP3o
	 e7PlP5JYm/bmX/E7l7j3usNiMRvlXhr/UWNMuHj4y+Rlm4v8z1kzwJCtHU2QUEBvriA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0rjqH4N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6782606A325;
	Fri, 30 Oct 2026 04:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0rjqH4N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D541F000C1;
	Fri, 30 Oct 2026 04:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336077;
	bh=cpVmLAkXUEKk1gtTsJfO0NQgZBTsyiKIKho12225nQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0rjqH4NxpmPUW2XwSWB5rt5Rntl0Svo766Hc3hXQigqjUmaLUR/FvGNW/+aVjH6T
	 rKkWA8BNWd3Q2wQMidinQjDvyX5n94HgxgYVOb2yx3lCAKTK8G6qfR3eLcJsSsBvgS
	 QAEEGKPmfE+PDYHfCuo994Wpq83IXQmr0FjW5y6hIrxzH39UB8UzTR5ZvzOosyshNB
	 xnGMY8oQ1GbaTNK6jiwbHL6mF4RS4G3wiH0fARalezOD/2ZlVdzgiCv6cxLFEV7Bf4
	 avt/3Cpa6iAYsudS4bDvEerroeK08Pkh+VF2ttiqdSLhQ/E4YlmOH59K1JKsujHHOo
	 1/VCM9yTjTCiA==
Message-ID: <sashiko-outbox-190514@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 6/9] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260915123812.14747-7-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:36 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: missing DSA_TAG_PROTO_AIROHA in eth drivers breaks offlo=
ads
--

commit aaecc61a677f69e71544a1c2a64947df3cc03f58
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: tag_mtk: add Airoha variant usage of this TAG
   =20
Add variant of the MTK TAG for Airoha Switch and comments about difference
between Airoha AN8855 and Mediatek tag bitmap.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 7507d632e7c6d..c5659e9ab6d35 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -75,6 +76,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		=3D DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		=3D DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		=3D DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		=3D DSA_TAG_PROTO_AIROHA_VALUE,

[Severity: High]
Does adding this new protocol break hardware offloads in the ethernet MAC
drivers?

The Mediatek and Airoha ethernet drivers explicitly check for
DSA_TAG_PROTO_MTK to enable hardware DSA tag extraction and PPE offloading.

For example, in airoha_get_dsa_tag() in
drivers/net/ethernet/airoha/airoha_eth.c:

    if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
        return 0;

Because DSA_TAG_PROTO_AIROHA is not matched, the MAC drivers will skip DSA
tag extraction, leaving the tag in the payload. Will this cause the hardware
to miscalculate IP header offsets and break checksum offloads?

Similar checks exist in mtk_uses_dsa() in
drivers/net/ethernet/mediatek/mtk_eth_soc.c:

    return netdev_uses_dsa(dev) &&
           dev->dsa_ptr->tag_ops->proto =3D=3D DSA_TAG_PROTO_MTK;

And in mtk_foe_entry_commit_subflow() in
drivers/net/ethernet/mediatek/mtk_ppe.c:

    if (!netdev_uses_dsa(skb->dev) ||
        skb->dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
        goto out;

This could entirely disable PPE hardware offloading for the new Airoha swit=
ch
protocol. Should these drivers be updated to also match DSA_TAG_PROTO_AIROH=
A?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D6
