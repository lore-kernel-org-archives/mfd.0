Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974657;
	b=zvlz2XidHqmyIBbYvFPejqjzuwmoUYIj+GHsjt4P6YqkqYoth+t/jC/Z1l00fhWMn5Hv
	 aZDRH1l1bQ7t57Vr3WzaJYnpHwZBKk87oKEV9ICUpOngnUAMFf00u3XABpbaD1zxy6lKO
	 c2eixJKlwf3EZ5cYNuYI2VgrxZ0j6WXzbsAku+ZUAC4/lrbkn3Yj2uoid4eJjyrNKZQfV
	 YJyvRrIUUZIsyX3dSRKOMUvrMXnOCYGtGof+ydzR0rKM2bJGQJolLjTIn5Y8njhYEaoko
	 GzZzLQ3tY2tovShHIZuLjH2Yn+fAe3iiKNSDJ5Ihp6JOvKukKPdXzdliGZuGZuT67xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974657;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fN67aiy/Xlf48mXp1t4F97GFDElf3widim7+3vdKfWQ=;
	b=NvlMbBCAR50mBXXfV/AW/I0Px0jCGUo+btnIuYavgMZnrln+P3GyarnjWj0KP3mdK2YE
	 svNpMBO0i/jyeGot3w9PWs7awfdLo9ZQHBemaxRWZFQawHriR0ArtfcCqUBITwGqC6XQi
	 fDLzDcB3GAnd6r+2EB/NeLbmfUWRTaayfo6KDP8Dlyg/JxAMJeoV1Kb/JiZA/g9j0Xt0H
	 GZpoNgZp+CILp/LP0R/pES11E/qI871K9P4EPAUqB8H5CCGCojjb6u5Q3iyWuWOZQRRr4
	 YYdgaug656pbfmzwCRiPxnr5j/SH6mAzsqcMi4WMlv5aPUYtH8qnOIhUpSJ9T1GkJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KprRkPZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2B606A331;
	Fri,  6 Nov 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KprRkPZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A651F008A7;
	Fri,  6 Nov 2026 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974657;
	bh=fN67aiy/Xlf48mXp1t4F97GFDElf3widim7+3vdKfWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KprRkPZ/6XEURizhTxGuC5b/D7MQkyyhICrXzIUvrBdsH2CX79ppFFHQSUs5xLHZF
	 M+Vk+44p+NaO0vkC2wAw1kT9VBmrFm40VyVZkjEndcX3yxrSHb/cMRFJSjgH0Icn6X
	 9BReUc8lvty7k03F5VxpuKoOcXZdwiSOpFQTwc2VOAK5WiGQ7Zi/6tQy2aZjS0gOCN
	 rFKO2+CHcHpsXQHNlRgE3+CFpNKBazakAFgDy2qa0vWyP0y6aCS6RSkUTKMAylnq0f
	 HtBaDiFvZvwwZKntF+VU7qxX0jGocpKSSirh8svIg11K7yzySVWkRUCQIL5oUaQKW3
	 eZlni0sMADUsw==
Message-ID: <sashiko-outbox-201561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/8] net: dsa: Add tag handling for SoC-e
 switches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-5-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-5-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:36 +0000
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
- [High] net: dsa: insufficient skb headroom in sdsa_xmit() for
  non-802.1Q VLAN
--

commit ae5577cfb919384ffe32e9238c7345ef431b5a12
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: Add tag handling for SoC-e switches

This commit adds a DSA tag driver for SoC-e switches using an 8-byte
EtherType 0xdcdc SDSA header. It handles transmit and receive frame
tagging, including 802.1Q TCI metadata encoding and non-802.1Q VLAN
header insertion.

> diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> new file mode 100644
> index 0000000000000..dcfa5de0ac6bd
> --- /dev/null
> +++ b/net/dsa/tag_sdsa.c
> @@ -0,0 +1,168 @@

[ ... ]

> +static struct sk_buff *sdsa_xmit(struct sk_buff *skb, struct net_device =
*dev)
> +{
> +	struct dsa_port *dp =3D dsa_user_to_port(dev);
> +	struct sdsa_tag *tag;
> +	bool encode_vlan;
> +	bool tag_present;
> +	u16 vlan_tci;
> +
> +	BUILD_BUG_ON(sizeof(*tag) !=3D SDSA_HLEN);
> +
> +	/* SDSA carries no TPID, so only encode 802.1Q C-tags. */
> +	tag_present =3D skb_vlan_tag_present(skb);
> +	encode_vlan =3D tag_present && skb->vlan_proto =3D=3D htons(ETH_P_8021Q=
);
> +	/* Prevent the conduit from inserting a VLAN header ahead of SDSA. */
> +	if (tag_present && !encode_vlan) {
> +		skb =3D __vlan_hwaccel_push_inside(skb);
> +		if (!skb)
> +			return NULL;
> +	}
> +
> +	skb_push(skb, SDSA_HLEN);

[Severity: High]
Can this skb_push(skb, SDSA_HLEN) underflow skb->head and trigger
skb_under_panic() when transmitting a packet with a non-802.1Q hardware
accelerated VLAN tag (for example ETH_P_8021AD)?

sdsa_netdev_ops sets needed_headroom to SDSA_HLEN (8 bytes), so
dsa_user_xmit() -> skb_ensure_writable_head_tail() only guarantees
SDSA_HLEN + conduit->needed_headroom bytes of headroom before calling
sdsa_xmit():

dsa_user_xmit()
  skb_ensure_writable_head_tail(skb, dev)
  sdsa_xmit()
    __vlan_hwaccel_push_inside()
      __vlan_insert_inner_tag()
        skb_cow_head(skb, VLAN_HLEN)
        skb_push(skb, VLAN_HLEN)
    skb_push(skb, SDSA_HLEN)

When skb enters sdsa_xmit() with 8 to 11 bytes of headroom,
__vlan_hwaccel_push_inside() sees enough room for VLAN_HLEN (4 bytes)
without reallocating and consumes 4 bytes via skb_push(skb, VLAN_HLEN),
leaving only 4 to 7 bytes of headroom before skb_push(skb, SDSA_HLEN)
pushes another 8 bytes.

Should sdsa_xmit() call skb_cow_head() before pushing, or should
sdsa_netdev_ops reserve SDSA_HLEN + VLAN_HLEN in needed_headroom?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D5
