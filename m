Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272806;
	b=m7q5BsLzyn/4v4jwzHbg/m3RpJXpZJr2O7bURsR7dzi0mtcMyjoxd5hfEfoI/rQOZ7si
	 +v4J8e39HsRwVsl2Pvjfbf3aFH9HafWd/hZxraJj4jmssyL2j2Xxjg8nCt1ILpHreGMMW
	 AlfOC1+CIhKcJUl/9GtJEJ+W7cviIQ9DvJcDRGx0vpL7NTLR2DaJuvjHWoRVPbbfmThAZ
	 MVrBU10InqWCByebDJSEVaySJHb3hO2AgS19cjASM8A3ohlTsRGpXISBoaACDkTF5Kdzd
	 N/MVEhlu1gf3EWDpslcdx+pE+08dcfGhi5kqvJF5F3CTcXjrkcXS56hu82oj5hJuVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QSd3GiWmP6xYymKKiR3p4wAfuYtNu9qxM7cKcMoOREg=;
	b=kLowxzc1MTETzs9FU4JoSMX2BSm7WTnjZoWdku+e8cZYfqlI8+fVVUQZXo/HSG+T8jfQ
	 HCQCXeEDtyo6pSrJ9wdTm9u/cdogDhQhtr2NnnavWo/UIV5qvaRtcYhiHvmJtGGxAqoDW
	 Vkm23H74cnJwVychZeBMuvW36MNUh3ny7Cdr0Jp4WH2gy0NCBGTQlPw7cD3/hRPBJn+hX
	 zhjsvZiMEu0wk+QXbzyV915L4vcH5eKfMiU7fJ8smGRCHFWPqRb8qvqtdnWdfTPp1Fc91
	 uh5ZG0ObKxPapY8hVTegrPuidfNvFqs5+/dxZfjVNleGA5N85xi/KDqdVgGy5CFV6kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nnH3u/7S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5478606A32C;
	Sat, 21 Nov 2026 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnH3u/7S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258011F000C4;
	Sat, 21 Nov 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272806;
	bh=QSd3GiWmP6xYymKKiR3p4wAfuYtNu9qxM7cKcMoOREg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnH3u/7SIfPDSCpKFAfKO+lJ9WmibmQfTvyQSoomD0cVJW8sjbcqygM/cjftvP5ou
	 WXUrTIh5i2mfXWoIvqaqHTfrC/NFWnqc7u1/QlrblbEPQwdaC0SWn9Q+C2CVudteXG
	 GXI2KrlSkMKtyx8EcA7Y7xwLAOfnjJgqpVsmVYGIdmeIFnGl3/HZoEFQW8Ul+ka04t
	 4mDvJ6o//727FhxEFRNnEd6JPWRgbtfDKofVG1n7NIvmSspM+v4C4uIUryyHzROcGf
	 6Pjiy8YPiiCUMlPvRO3e0mi2M96IY0pAVzJOmjCWQ31wh7EYR92pH+hIfXBnX/dMK8
	 tAuYhmsPiD4JQ==
Message-ID: <sashiko-outbox-227109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 5/9] net: dsa: Add tag handling for SoC-e
 switches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-5-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-5-5de9225715e6@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:53:25 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: dsa: broken flow dissection in sdsa due to inflated
  needed_headroom
--

commit ff03e408d05d4a91db8a81df7f6cead0f9e1dc6f
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: Add tag handling for SoC-e switches

This commit adds a DSA tag driver for SoC-e switches using the 8-byte
EtherType SDSA header.

> diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> new file mode 100644
> index 0000000000000..c5a9f61edf405
> --- /dev/null
> +++ b/net/dsa/tag_sdsa.c
[ ... ]
> +static const struct dsa_device_ops sdsa_netdev_ops =3D {
> +	.name =3D SDSA_NAME,
> +	.proto =3D DSA_TAG_PROTO_SDSA,
> +	.xmit =3D sdsa_xmit,
> +	.rcv =3D sdsa_rcv,
> +	/* Include room for an accelerated non-802.1Q tag pushed in-band. */
> +	.needed_headroom =3D SDSA_HLEN + VLAN_HLEN,
> +};

[Severity: Medium]
Does setting .needed_headroom to SDSA_HLEN + VLAN_HLEN without a
.flow_dissect callback break flow dissection on the conduit?

When ops->flow_dissect is NULL, __skb_flow_dissect() falls back to
dsa_tag_generic_flow_dissect(), which uses ops->needed_headroom as the RX
tag length:

include/net/dsa.h:dsa_tag_generic_flow_dissect() {
	const struct dsa_device_ops *ops =3D skb->dev->dsa_ptr->tag_ops;
	int tag_len =3D ops->needed_headroom;

	*offset =3D tag_len;
	*proto =3D ((__be16 *)skb->data)[(tag_len / 2) - 1];
}

Because received frames only carry an 8-byte SDSA header (SDSA_HLEN),
dsa_tag_generic_flow_dissect() reads the encapsulated EtherType 4 bytes
past its actual offset and advances nhoff by 12 bytes instead of 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-devel-vstr=
assheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de?part=3D5
