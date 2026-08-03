Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458338DC59
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775538; cv=pass; b=bCP88IaK7HxKbsvmPIHZwQHvM1KktDPdXVSwt8x8SPmhXno8+DwZHzdIy6GoBenZxSb+w4aQHpGcg9584mlbboiuT5UFo4Rk/pgJOU5QFS5FS4JBpGXs7FjHg1G+9H2sOWFrh7M4Fjhc+Fidly/1UZCLreqENavA35YBMG/xsYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775538; c=relaxed/simple;
	bh=pVJ/u9SrHtpIYcpsDllTKqpayBtCBNOqrDA3wdvqLR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZtsogAo2dTnpnTxvM5+LaJbSUjN3kC7RvmcksJdT3x+yscsNIJO0Q/4VlILIABlAsQM576xu2dbiri41HfJbvwLVqdvWnc4l8Z5t2bivMVxxV1HqYv6pupja8RYU3AKhH1p+d+VUuX587dxCZNc7dXbOmgVDeBKqmARqbb4rAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKmda6lI; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKmda6lI"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-977bc1cfc6fso889554241.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775535; cv=none;
        d=google.com; s=arc-20260327;
        b=YzO332LRa9WNOaVBGlUcx4Ut8ftw5Lkr9qHR4wUnj9CzDQPBxnzWQhErHAzL9xv3Mx
         0hboLDN43kCmWS+ZCfW0FjRKMou3SVOilIV0fNpIcRBSrrVbqnm3Xb1JQVZZde/Syc+X
         Gp4Ehu6FkFn8VydB86N3EOslUgLvCWCNduYBgpd3Kd4UacpIYejS00dXfUkPQa8M1OYr
         AnbuKyV5TFsoqVzjViaUEZ911N1b9diz7wCALl6o5vvYCOgSM2RIZh/5kbXeRMP3AzbP
         /Q2/h73UMb2YNLilpV4SNy70TJKyyGRhdz8/TMagj7FN5d2iAvem8wy8vUHc6uFSCHIH
         Ys1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        fh=5KXVIk+wVPJbuwdh9MfGA96W5ZiWYZ/n5arICiK3If4=;
        b=Jt0+YToLNRWT69VqyB7xQ4sRdafvw7Tm/SVG9cZF6mWvQ+LdX8hLcHqudK3tAoS0lz
         t8k0+Zm0bzP+EKzhcjEDpN4BfSqkDkaH/CPa0gncc/ZVDfMl4/3LjuRcVQB8VsaXty1z
         Chv/hT6uZl2XrkWj5DoJl/MLeSnbM3VQlM7hgMqm6JseXzIiaoIaL0AS8niM788L0Vzn
         Th+QWqHLlI5UldcI+NJWKqj4CoOUj8EMz6EC1Sltvtp8XAAXl6/v3kaV4lhrzSfbr9Z1
         GKEv3AGE6ZZonOWPsAGbQLL5jg5D1jV3jQTFSkGbY+R7FL6owa1VJQ4tg3vWwy9ecQTj
         itnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775535; x=1786380335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=fKmda6lImSp0FCSy1CHg9tk8w1tieUXduSW7uRKmi6vNWKbMJPkg0li8BBydJxV8+Q
         D8WBWNOYV+mKI1/9aqfYF9JPcjIqkkGNzWsQq7NjZCPMDQ18bvniHkA+WFhMyZYclpSi
         VEeUbHu0yqJf6Z/5UWK7ndgiMvV76oRmSqCPCJJOpNtu0TP9UwrM1pf2JA6ouErcV0Hx
         CCmLwqzFJD6qAwZl6S/vGhCcB51QcpO1nOG9CsBn6ZCeX/fK0AQBys2YNqr/ku213sCM
         2Tfb/rSXYNwE8PMaNgQVj4BP90FViYDcTed1QH9x8tV3iVW7uBulpBxvDWhwH9hJH6Ed
         SmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775535; x=1786380335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niqvePJlDSQd28Qyc7y5gE/vwAYMmaOcsvRZCG9PwY8=;
        b=O/9t1WzkWfeJEE8lIS3pd1o65jD9EuEsXH8duANHfsaYWNyWf8nKxCdnpbGRSOYt/v
         lMDFoHaPMIW8uuV0jNxXx5MHhpKOurp5I2gQBoAkJ8KSp87X4q5j2ag5mkwpEmieNwEF
         u0BXmt1jPY7YT4koXlRYlmHF4ccLdCsjir6CWlMmyHiXod+RxbY8Rp16S5906t2bN0hs
         8n+6Q0Iy1znd5/mHcJNkiyF6jNzblgU/qWDnf9gCquhFEQHvWAEWny+oePE57yFRvNlL
         2sxir9Uty5jcxRQew0FXdDPId25pKYyKS6PwV4oRvQ/i7fpHak4EA3JY9Rcmd0Pqh5HX
         pFNw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/WzXB9l4JfPqJeCzPGjadfQzWEvx4uIoeYI8oVlhZ2nyGPt6KNJNqRFX+YCD0m3JL6j0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgNtKiOt7ztebYfs6ryuA0eGUKQpWlPZ6o/i4uRqlkqB7zvuEu
	Ow/ZlR6nkipthRlygmwA1H+4dBRmbgT8ZLAdLEUmbbJKl3IPtMAi4U/te/VtfY2lnQ/8UJTIFoM
	nHEYetZWdB3HQyRdlq/PrAtEfR8NdG7E=
X-Gm-Gg: AR+sD10x1lMX/jLUfOTdJwR+AeRH7YiKO6iETE/cGyYw20EPd0eBlrraMMv6vKnDYeZ
	5PhHVRTh3x9mq4n0pHQwrFfHyOddcW49K48qWAieIaCqkx2tzY+Ql9Rha6wJIBL200CsyZI/3WI
	aUQPAAApQRiq2ijh3oyPBuE99OND1T6yvHu4/KwEXaKzlul3hOxs77VW2KDddFau5bHKS8F22JR
	0/xzcuDReOhTgXy7VIl+f2/4c9MTqn8hzfneoDCtSACXLwIvNLRJ+KOoVKYpYJl/S5Ns1eizap0
	/iIydGSc9Iz3TpC7ACtBak3E0kCd6JUazGIMmscwiLGYi79rS7R3x5Ns7cXPcCEqy2ln6YeIcVJ
	ccrprgE7nN4+UGowNPTIrFnXhltxDPD7YhD49XpL5HLZlbhkRuekCqXav+JPDaKGxc/UzfNvuJb
	bP4fwXD3XvFrwIwsHcNxLa774Mort3VHqvzdYv
X-Received: by 2002:a05:6102:5e82:b0:73a:128c:4e3d with SMTP id
 ada2fe7eead31-75b22b6375cmr7983333137.8.1785775535469; Mon, 03 Aug 2026
 09:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
In-Reply-To: <2c0210b3-2c68-41f1-aa33-3f1693454849@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:45:23 -0600
X-Gm-Features: AUfX_myHhqSCOlS18NU3-rnIJB_yJDCs5Z0LNUdIv6o7tNasY8YkhUjPJd2Ilvs
Message-ID: <CADvTj4pfNFVGrQV86T7X+nZQYUamxEYLLWuxVXk=av0da_XocQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:18=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +            ethernet-phy-control {
> > +                compatible =3D "x-powers,ac200-ephy-ctl";
> > +                nvmem-cells =3D <&ephy_calibration>;
> > +                nvmem-cell-names =3D "calibration";
> > +                phy-mode =3D "rmii";
> > +            };
>
> What do you mean by an ethernet PHY control?
>
> I assume this is not an actual Ethernet PHY, but some control logic
> around it? Where is the ethernet PHY itself?

Correct, this is not the Ethernet PHY itself. It is the package-specific
sideband control block that must be configured before the normal Clause 22
PHY registers become usable. For AC200, this control block is accessed
through the parent AC200 I2C regmap. For AC300, the equivalent control bloc=
k
is accessed through a separate non-PHY Clause 22 address.

The actual Ethernet PHY is a separate device on the MAC's MDIO bus. The
shared PHY driver for that device is added in patch 16:

https://lore.kernel.org/linux-sunxi/20260802-submit-acx00-of-dynamic-v1-v1-=
16-0a53cd9e21cc@gmail.com/

The later board DTS patches instantiate it as an ethernet-phy node beneath
the MAC's MDIO bus and reference the appropriate sideband control provider.

>
>        Andrew
