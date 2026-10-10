Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127243C1400;
	Sat, 10 Oct 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648700; cv=none; b=ASN7Y619GICKwd9ooaxID2rRQRKSfWqfm/ZcG3NKlkA+RzMkGvRqpBZTQ8BZTVCVj89S+RFQgzu8pf+aekTDx5Bq1vrV2ORhJIvc8vx3btMX3yvBaq/ZX3mTLvDOfZjoNT7Wk8rY1o6eumVlTB9s46Pb3Ry9Z9mYNPg30N2YIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648700; c=relaxed/simple;
	bh=yTzHMQx+LsUaNDlL082xKJS4BPTeNLAIX5n1Rfskq64=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=InBA/1sOqjfpgw+dyAOTa8xgILXjQhO+1pnEeYr1Op5EIS9iRwu+1iTVzQewEpntS9E61KDVoM+Tw8i0tGVNjiJjT8popu91vSIFFqr34Uxa7xPQDoLUlwySVbVxohv2cwU7gt+1/X46FYSa4jTOH+7rJAO5VWQA9xguRr1rElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXXmrc+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXXmrc+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A5B1F000FF;
	Sat, 10 Oct 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648698;
	bh=Kpj0Fb6sJzD6Fk+U0UkEnTMmTVIDgoQJDdH0CFMWIpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXXmrc+4eLxG/RLMeKwXKpI4XMfBJXB7LSot5KFtHFh+Nxbn/kFkS5pkjJyIe/u8M
	 UXcLzOv4HZr0fBMgAUJNCKpEJlGaRSr7bstRmMwAqv3mkztGx6KKhUUfds+WrTKz44
	 b0eNfsefgYN+Tnsn6iyVAHit3jVoWuhQN8YzUVxZsyQwM8oromKXqs7jI41xEpjD2J
	 H2CLuWuHd9rJkFnBsrjD0uWcNawZKMP31owJiyKTtBW17qOdF6aRm3cG4KEWji18P7
	 Kcx1RviFB7PhfnCT7x1OLFgTJuUKZVyYx1u01KgmZRD3n7YvUGQpO7YS9NEQlRNtrM
	 T4wMgO0+SCpOQ==
Message-ID: <sashiko-outbox-166718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha
 variant usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20261009161102.38961-7-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:37 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: airoha/mtk eth: hardware offload broken for AIROHA tag p=
rotocol
--

commit feed6f0245d293aabba2178225f4097258a1d66c
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This commit adds a new DSA tag protocol variant for Airoha switches,
updating the Mediatek tag driver, Kconfig, and Makefile. It also adds
comments explaining the differences between Airoha AN8855 and the Mediatek
tag bitmap.

> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index 5d12191b6f6f5..9824c63ad50b3 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
[ ... ]
> @@ -76,6 +77,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		=3D DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		=3D DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		=3D DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		=3D DSA_TAG_PROTO_AIROHA_VALUE,

[Severity: High]
Does adding this new protocol ID require updating the ethernet MAC and PPE
drivers to recognize it as well?

For example, looking at airoha_get_dsa_tag() in
drivers/net/ethernet/airoha/airoha_eth.c:

	if (dev->dsa_ptr->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
		return 0;

And mtk_uses_dsa() in drivers/net/ethernet/mediatek/mtk_eth_soc.c:

	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto =3D=3D DSA_TAG_PROTO_MTK;

If these are not updated to also accept DSA_TAG_PROTO_AIROHA, will hardware
tag extraction and PPE hardware flow offloading (like in __mtk_ppe_check_sk=
b()
and mtk_flow_get_dsa_port()) fail because the strict protocol checks against
DSA_TAG_PROTO_MTK no longer match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D6
