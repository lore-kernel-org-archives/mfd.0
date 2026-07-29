Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A13064B5;
	Wed, 29 Jul 2026 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345395; cv=none; b=iWoaGGqMcnfNze7Ttq/LAHvCkpqCql9FoOiGXiYlBj8RQEuQjQBF0MbJ4sSW2qa6P9X8EqDlCGmB4mL76+eQiZ/LFGqnf27fRupSL3WvZUVpbkCpEJSzx7bSLu1v7mTO5ifvJewODLhHCBLKe4TpXpAdkMPe72qypfNe+yjVWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345395; c=relaxed/simple;
	bh=1Wr6MddhiZoo0mrobyjiJZCZyvWwMJHSqcwp+nKwbis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/e3wYkvv5kpvS2ZQuoUecppPQ6S7LVFwmMvMO9Oz9PTdy2pdgXQMtgc2iycrNCyirmIb7GaGRB6A1X5lkQP5QW5vjhMIDCSLMHFU9IoGVaLqssyEUthu+IOe4RhimX/WOXhXEwNNnIwKVFTLQB00QqRCEqzBtSyGEqDGYDm+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8iJ4C92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8iJ4C92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6B21F000E9;
	Wed, 29 Jul 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345393;
	bh=Vu14hoOqHu7kL6akz/0SfotRbbjkLAUU8E9503FWyfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K8iJ4C92/1uVpZzZRSSj0O+zPBGYAylA6wTsIwaKVVcnxeCPJZ/XopVpgaHC0N5Bo
	 RFEise6rRwGsyyiEaziuqn6knAqArWc/CTTmYEMggtrF99rov2QPnME61rWQYsXiHK
	 StlfNMfom0pd9pc+I4eLoR4yd3Q4UvRuy1N+To8ns8M2i5zyowG/benf4ITUGRelqB
	 DRBEXgmyMj2zV1ql6rCP9LJFRb/m/GM+R2Qd3rkRu9VXcgJrBOWIxr/nvftDrtXI5e
	 U6ZbXQKOIgS1bj5rJGNA1Z0fael8BvXrzTcpYEI+eZWAkhCbvPvU+uLjbkOrtJBMl7
	 979oBcSRuvKWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 06/10] net: dsa: tag_mtk: add Airoha
 variant usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260728154846.1828945-7-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:32 +0000
Message-Id: <20260729171633.0D6B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Introducing DSA_TAG_PROTO_AIROHA breaks DSA hardware offloading an=
d tag processing in compatible Ethernet MAC drivers (Airoha and Mediatek).
--

--- Patch [6]: [PATCH net-next v19 06/10] net: dsa: tag_mtk: add Airoha var=
iant usage of this TAG ---
commit 2b8fd23ca8ea6ac3597ff1360a2ad1a9a14fa563
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This commit introduces a new DSA tag protocol variant for Airoha switches,
documenting differences from the Mediatek tag bitmap. It also adds a
dedicated config, makefile entry, and "airoha" name for external tools
like libpcap.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 8c16ef23cc102..9957443e2907f 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -73,6 +74,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		=3D DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		=3D DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		=3D DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		=3D DSA_TAG_PROTO_AIROHA_VALUE,

[Severity: High]
Will this new tag protocol break hardware offloading and tag processing in
the Ethernet MAC drivers?

Looking at airoha_get_dsa_tag() in drivers/net/ethernet/airoha/airoha_eth.c=
,=20
the driver requires DSA_TAG_PROTO_MTK to extract the tag into the DMA=20
descriptor:

	if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return 0;

For DSA_TAG_PROTO_AIROHA, this fails and leaves the tag in the packet=20
payload, which can break the PPE module that expects untagged packets.

Similarly, the Mediatek Ethernet driver checks strictly for DSA_TAG_PROTO_M=
TK
in mtk_uses_dsa() (mtk_eth_soc.c), __mtk_ppe_check_skb() (mtk_ppe.c), and
mtk_flow_get_dsa_port() (mtk_ppe_offload.c). Without DSA_TAG_PROTO_MTK,
hardware DSA untagging and PPE offloading will silently fail.

Do these host Ethernet drivers need to be updated to accept=20
DSA_TAG_PROTO_AIROHA alongside DSA_TAG_PROTO_MTK?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D6
