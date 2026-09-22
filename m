Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22852FE58
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072077; cv=pass; b=P8TXOdURML0EXZq8CABKtzCr2DdzG0H9FwYlos2tlQTIEpOjF1C2CghoZNieNny2DAouG3zvtfzLvp7p9ogbi5C6XnLOYH4qSQoolhGJLO5sY6K5Vw+rhQANUIl6CaRadg+PLs0+s/vbw/EqcSqCxqN2O9UiuhK3hlQdvTR/MrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072077; c=relaxed/simple;
	bh=MP7qOWwL+P1a6ht9RviQn5PbhcTDg1vQhBcP5eyXfGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjdT72UhmwhCYodI7fFBDizJx9nx5xyCtru14Lfrh/ebXEQh6svjZUjbFtjPf6xklfOE+5qNdOIVANg7jx5pB6GOdUz4J2GRTRKvGn49NdvUyfjqfhWNBKixEqdTFSB3V9q15hVFydwo9E+lG3rOKUNI1cvUAdhOwKx09yKGFsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvTxz3/K; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvTxz3/K"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so47091846d6.0
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072074; cv=none;
        d=google.com; s=arc-20260327;
        b=k2UpWd0GtXiYMbU+HKE2MDs90lunay+L2xNueGQ3fy+mZWK/6m+YiFaW6TIgNxQLLb
         +SNbjOutwUsA+wwqefYGsdp2frvYDOFrFg5ieOCPtXmCDbMt3Skfg9SzOYOzzLoOCZCw
         eMjqyCBNHZPDIy21CDc21/28/AToHQY5YrYK1Yxu7GwD96NcXkv+YxdtLYwS3azrRcXi
         phzFiB1kCWx7v7diDZeY9Ku1LsqNFQ/sfDEPvfKIqeWbfR+lfPZZdweq94U82cbWD7Tc
         FppivovA2KVAPs09O2fFAOg0h+MHU5TjylmG/EvOSaAxLED0KkWH0RY3D6ANoRV22OCW
         hg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        fh=DU3voBDRn9IflY71OAnm2cdyja3A8Ki1TQzvhmgilDw=;
        b=VSNemLQDtRZnrKmfG6GFyBHXYTgA6Ut6huWeYVk6RLflSQpcTBPy8G544LfmPudvP+
         U++0wugSA2LIiBGWS/k6CY3CESzq4bygYzIvD4BPRAC7vu5YNBERzco/lCvqbJsMgIoq
         3It+9TxGhEkqLgV9FC9594pzTaf3iT7Q2YQ10IdMg77M4JF5XRtAR2Fjmo3q6qDB/41G
         77/e0cbxWzyYU1ubhtMTTRf/tjXLdsk0p4B2HuCZZiDkhWU8MQYJKOGizy42p94PGYv/
         M6Ai9xxUJsJF1uHD7MymOP1erim0jYqArYcsQSd3tJs0c+9v1ysCNcPzlsvnEy4CPjFF
         kXAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072074; x=1790676874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=GvTxz3/KjlRmv7hl6fAAiJ+UyDQx4981rFK4qFqq2pBzlsNSfCb46NI3BVb4arMVsp
         BdOJWC74rqMjeAUwzt1zCht12TaTcXsKJMCTBhVv06Wz1L2/Cx5/NLXm9ItDkH7DUQLb
         bcOjT9aoblAXxmZQ+Fne635kR47T0gHg2Vw1e9sIZ4mkzJss/kLenyKxuF2gmVYc70vr
         9Db1njYqdj1MFf/rPYmUCEeh9MvcaiD0bs+fEVEYLbDhOcAm3A4gTWLUv2ySqYX6BM/f
         6hIz4t6Cia8XjWYLuU6yJtuGElqRrg8aN5vH8X0gnmDVB0iodE6jTq6k8KsKcjDrf24B
         SEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072074; x=1790676874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=eeeSBzyDdpFBAlXDIV4Hj8HEqcw7wM4GJozcbN8/0fJfNIsYcrly9Xo9YwvVH2iuio
         mj+vr1uGGIs3AP32BoX01tHpQSUpJiTcewLvaKeQc4++uOS55Ibj9Iko1ViQMD2upcTs
         5fVVyDUMmqJXG1EpKLecHrkkT4ZNJE5YPtXYqqfT2NuowPXQGefU3P6KT2QizzpZLsIY
         WA7aHxLu+wdQ9qyhOlq+srygT+hbnrN1oIxYZKaod64udp+BSGhuhUvP9iE+J+C2zpbo
         mYkkiz9Bb8O6BQIoKEBbVvtnpP0QdYRi/eF+v70wtgIZTndq6i5ITSHsaP4dpTdfLjg1
         B99g==
X-Forwarded-Encrypted: i=1; AKwUvBxTNc248qPPLyDkR9Sgf7Sw5VQZDnM0wYpNvnQqAe7Y9h8LTN6GNd9oDPVL0jCnnyIWc+M=@lists.linux.dev
X-Gm-Message-State: AFuF++lTNnvA/4AdBTytES8x/ADcZTC2a2WURHTRp2Bl86QNa5uPDLgt
	xVA7YvFbu916mmjtqyE7iZNPvf0mE7fKILLkVOubKPzKeKoT4i9eT+ljBuLvF625XQR2r9L8SSc
	0mYVwOdH3WNQIPEOW2Sp+BO6eGgWw7Fo=
X-Gm-Gg: AYBFou3rI1GxhURaJ0c2Imtz4XaZuSPzTaoGk620l9hC3/peqmVXoR9TzlvBWM2HKko
	d2CuIIPFvjJfIe0fxQgH7eCoFBqS/8WFAo8uoAp5WYehFgdUL3DA69K7TwPsErJaWcYuGavB3Du
	jRb8zxfnqt/8eVhnYaLadLZTInG08cVlgh3NICbNxbZGloREJn/hVuacuIkKmZFyrk+1a3Rqb/f
	lBPpHMwQcBS4GlWITJvMrt2QDr0dyq0mkDeI06tn4kxafafE14zNjbYADOgl3jZaySOg++uO+AN
	TDG0awhCUgdM6PtLz0kBYZibxZK9NTd/pgjAPNTyZrvSnLWFqu4VIj4=
X-Received: by 2002:a05:6214:d63:b0:913:fa79:99c3 with SMTP id
 6a1803df08f44-913fc94b160mr46562816d6.43.1790072074583; Tue, 22 Sep 2026
 03:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915123812.14747-1-ansuelsmth@gmail.com> <20260915123812.14747-5-ansuelsmth@gmail.com>
 <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260921134410.13a7173c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:14:22 +0200
X-Gm-Features: AcwNN1WQadm9kZulSu2D2w98S17OkpHd-MeZLtXiKqWwHyLw9Fh6tPwUuh65TfY
Message-ID: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 21 set 2026 alle ore 22:44 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
>
> GCC spews warnings:
>
> drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
> drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 direc=
tive output may be truncated writing 4 bytes into a region of size between =
1 and 61 [-Wformat-truncation=3D]
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                                ^~~~
> In function =E2=80=98an8855_phy_bus_register=E2=80=99,
>     inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd=
/airoha-an8855.c:469:9:
> drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 2=
147483647] for directive argument
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                             ^~~~~~~~~~
> drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 outpu=
t between 6 and 76 bytes into a destination of size 61
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>

Hi,

 I also didn't receive the email for the AI review... Did it broke also her=
e?
If everything else is ok, should I send new revision or maybe we can pick t=
his
and I can send followup for this warning?
