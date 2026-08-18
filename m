Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67183C063C;
	Tue, 18 Aug 2026 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043807; cv=none; b=fwLyy8WL+WwoSS7abV9+9KGoAf/FCqQMO+fD0D6wx0r04WrOaEmeN4lCMIb+tUGzxpvzysJwvWsUqUWPjSF8AzIZTf+Xv8wG5mnDfPbekbHJCXX12zMEgYtAI9sSrsJCFx8wmxstTmvRxe4VXy9ohYmizKor8m+IXqirldjQxCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043807; c=relaxed/simple;
	bh=a0svX8f9VO3395qY7sAFXx04Vle0Ew8HgEJHvv8ak/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rjr3+t8+l7nbs/L8nG4dPYKmShnICukiIR1ZFFAZF7wHR30NAhKn1qAk2VtBPff1GGhhEPfEuk44WGtd5CYMBeGYN04HaLdW0dX57FYFThVBZJHbz5M3On2QnC+PbEFZTS1jvEIPYX1GZwrMOduhOeXdtEWm/72Py0QJKSezvFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiiAv0nO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiiAv0nO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA811F000E9;
	Tue, 18 Aug 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043805;
	bh=wi8qpfuItg1JCjZzS0mKjzAgjuxm5FVWECf+uoxuMQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JiiAv0nOcNCRYW+tuK772GhixsCavxskrZoX18ZXLhI0i2L/HCdxfq4EByhi7nF/3
	 tiqmezxk+um2P446iJh8hjQ5AR17I94MW3go7t8UwDDtfitQcuMyEKCdxIq5NrAFlM
	 fj1J5b5vZ8m1mhAWMP4WEPgfg0F2VgnU3P+qOX0hKHlukNJEjFuDtLMeXxhr8KI3V4
	 TntpuN8b3GNfRw9/v2YE7CM12zr5guKzLoy3uXuS9qobI4/uvcs3idxvuwnZ/rJJrd
	 Wga0jvhXDm9DdkQQix+HhLKuL7aDt+0Ikn9OVva4yVCU18IXtiM55lEQcb1i1GRtm7
	 yExHwAZ+Sczpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 06/10] net: dsa: tag_mtk: add Airoha
 variant usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260817082034.20326-8-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:24 +0000
Message-Id: <20260818090325.3AA811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding a new tag protocol enum for Airoha without updating the str=
ict protocol checks in MediaTek/Airoha ethernet master drivers silently bre=
aks hardware offloads and special tag functionality.
--

--- Patch [6]: [PATCH net-next v20 06/10] net: dsa: tag_mtk: add Airoha var=
iant usage of this TAG ---
commit 9a6d2b41d720a4ec342b1d91531294b7baced74f
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This commit adds a variant of the MTK DSA tag for Airoha switches,
documenting differences and introducing the new DSA_TAG_PROTO_AIROHA
enum to report the Airoha name to external tools.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 6f7f5c17b5320..396c1e5208523 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -74,6 +75,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		=3D DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		=3D DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		=3D DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		=3D DSA_TAG_PROTO_AIROHA_VALUE,

[Severity: High]
Does adding this new protocol enum break hardware offloads and tag
processing in the ethernet master drivers?

Looking at the Mediatek and Airoha ethernet drivers, they appear to use str=
ict
protocol checks for DSA_TAG_PROTO_MTK. For example, in
drivers/net/ethernet/airoha/airoha_eth.c:airoha_get_dsa_tag():

    if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
        return 0;

This check would fail to extract the DSA tag for the new Airoha protocol,
causing untagged packets to retain the tag in the payload which breaks
the hardware PPE module.

Similar strict checks exist in other master drivers that might bypass PPE
hardware routing logic and L2/L3 flow offloading:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_uses_dsa()
    dev->dsa_ptr->tag_ops->proto =3D=3D DSA_TAG_PROTO_MTK;

drivers/net/ethernet/mediatek/mtk_ppe.c:__mtk_ppe_check_skb()
    if (skb->dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_flow_get_dsa_port()
    if (dp->cpu_dp->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
        return -ENODEV;

Should these master drivers be updated to also accept DSA_TAG_PROTO_AIROHA
so that hardware capabilities are not disabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D6
