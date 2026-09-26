Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F73876CD;
	Sat, 26 Sep 2026 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447124; cv=none; b=OEiHW8fY85ApKeClx8KIJRO+WRt53MXRDYYaBAKYSG10sUnjb8wL3HOy63FwC/zX+yaaj3GQ+GrzUFR5Zz1jceJjzJQGxu/XEU00KqGiMH/ZMAzt8OcDgjSNMGJ9Dcc/hU4fbwV0ghfGMGvMoFEGkSUZSlymD3wkqUvjCzhcOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447124; c=relaxed/simple;
	bh=r5JUjpPtfeHc2g+RmaprHDS+BaVY8EMaZBFSncXv+u0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fxTafv9R3dSH/s3ShryWg3Cvk5KA40CkWOhVjQpDTeshXhTaH9T/7M8Fr+fkggS/u3qdAdPO5BHtjtTRo5ZIXrXvw3gjsX6d68X4FsOocNbcfUqW1CgqW6FWyWWYfdS1ufuSchqGe2WD5KrNfcFkf9P4GaOeU7WVODr93vxvsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqcxFY1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqcxFY1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63F21F000FF;
	Sat, 26 Sep 2026 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447123;
	bh=8QEiZ7bvH0DfhHOMkKlVi6slsMla33rhNMtYBerZkTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QqcxFY1gZfkspjC24t9UMzh+20NPQm9jFIG4my9u+EHKq/T+XKR4aa3gtEgVObbD9
	 e5Xm3HB//PvHN0pfj614+uBs2BWDC9KjYHMpAZiMQvNQhlo1/oRL2ZlmeOF1sOvAaS
	 Saq19SYRA3IihfHJBU34ApyYaTd6kQG4Kiv+BfxWj7jfD8MOW0CXpgs3FpVkKWhjPr
	 zb4ebrAJvOz2Qpdr7sQAVNIUOS6ntq/VbdHBoopcY8XYJMoqxHGUQdFWE0pnug1iwk
	 fcQImgT/i1gA4fmAnRlx+bN+wZRnSCpxx/VwNbhu5VilCh6YqAkG20fl8CNbBtsuLg
	 f2hNXLS5OJOkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260925182435.21207-9-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:22 +0000
Message-Id: <20260926182522.C63F21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net/dsa: mt7530: lost multicast counter in rtnl_link_stats64
--

commit 7c73e5182e23c339dc9a92fe7e7c4d4b45721dd7
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: mt7530: generalize and move common function to lib module

This commit introduces a library module for MT7530 switches, moving common
functions there to prepare for Airoha switch support. The migrated functions
are generalized using the reg_field regmap API.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -861,38 +833,40 @@ static void mt7530_read_port_stats64(struct mt7530_=
priv *priv, int port,
>  	 * To simulate a global frame counter, read Unicast and addition Multic=
ast
>  	 * and Broadcast later
>  	 */
> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_UNICAST, 1,
> -			       &storage->rx_packets);
> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_MULTICAST, 1,
> -			       &storage->multicast);
> -	storage->rx_packets +=3D storage->multicast;
> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BROADCAST, 1,
> -			       &data);
> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_UNICAST],
> +				   NULL, port, &storage->rx_packets);
> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_MULTICAST],
> +				   NULL, port, &data);
> +	storage->rx_packets +=3D data;

[Severity: Medium]
Does this refactoring inadvertently drop the assignment to storage->multica=
st?

The hardware multicast counter is correctly read into the local data variab=
le
and added to rx_packets, but it is no longer being assigned to
storage->multicast as it was in the original code. This will cause the
multicast statistics metric (exported via rtnl_link_stats64) to permanently
report 0.

> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_BROADCAST],
> +				   NULL, port, &data);
>  	storage->rx_packets +=3D data;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D8
