Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6DF46AA98
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857210; cv=pass; b=LOQ9BXJyr1XP24H0Y9nd/ot5DkD9zDiQ1W7Z4M3/VWXo4MM0CcAApFD0wbwdHKWxuiqjuASccWOoRQ1hyq20lmJjymOKYFiMGLiXOTaQSukYaimw/y49FpxcXlqnZJWwTjmiKWV4AmAsL1/dKY4l+JPo5DxcyWNXNG5BbGuro7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857210; c=relaxed/simple;
	bh=XUmOi/B6laQ6eMCxOrhzePhtH6HxroybD30jr5qhuKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrnpRG14pQ+8Q8QhoGzWroz2ayZU1KobItp/pLNCzN2lgAgzrw+ANJFmjpqs/jRi4Jk9U9oZvqy1WyZk9sfo5+Uz9JG0QBLc6KVKNBRKpsnuaiGMBOEhzRSn7Z9U7r7Qm+7gKgzM33slJfEuOAnNueMTfp81AhyrOhXfp1YdGq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUtl7USk; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUtl7USk"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-738a5cc517eso3273748137.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 08:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857207; cv=none;
        d=google.com; s=arc-20260327;
        b=E9W3MgnYD40DWfurcPe8+k7hZhBI994YZY6Xh2/uyrQwP6M8yZnsbyvtOZEOciOHn9
         pYDL9Pv++5pa6LNfjMtEyIR8hNtDKAwzzUp7L518qwHKmYZxHKPUAUwBx/zfL4aHsxMw
         Kn2smncnxp7IKSjKsp6lPjLy8QMkoAvlv79xVeH5O6n8tZztFkOclt5zhZj47Rw78h9r
         RKdHerWwW2fuc8eQ7ufzFnFPva61wLzxTZr4CDc+fcsrWLWVRfFT4xMzQ5Gmzdw0UEik
         PjjBYF+YuQGljGuFPvZnomgeR4EWz9WY/otNHvdYgoVPYn2HNkxBu++pTER2a0oacHj/
         Va7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        fh=xSYNxu5ru81e4quwamlAP9CMJajvPlhznH380DwVnmc=;
        b=kcF18Df7siqXe4taBskKlRUujnqQUeipVbzEFhXmGzBOkFSHIGYX9jgfcH+q/EV2Mm
         T043713e//pJ5VpDkX6MbZvCbAr0Pkoi8a4BD3GP419nIwS2IM/x9yPJ8gkFDiBCG9eG
         zHqZclV7EX7HxCfuX+XJlo8p76N4fMz0fsdjEGNBpzX/bPX38QAK2bIv6IOeyEIS73s6
         sDCXLQtU5SMODXu0fBHsSNbKKOoyCLmgc1V1O988mtBpYbXEsCuwiyuS7tlmvl8PTbij
         iMJA/uuy8qR4fTzAE4yUqWFTliAgbu/alGwCqvmWgqlFc+jr7LP2ag3RLkEFa9HAd1XI
         aaDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857207; x=1786462007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=BUtl7USkVLtaGP8chTA9Ss6Cd1KlaUPPKuLlzK3mvlD259L8XbL3mvBCdc86FnFtw7
         vqxccJ61+grL5H3BfMIphVJqiUTnwBrQupl0sfyintc+qXzcFoIkYMQITMO/ipNGncz8
         DkKpfbshrSbP24ORIg6yp8uaCBmcD5med71aHOlgejqhJwYRE9WkTl3ef6tHk/hFNwtW
         CZLKLiYIDXXIA6bRY0ynS5YlSntnprjUicrJjbUqtsyvQHxNkTGaz0PwMBRW6niwSojQ
         1vr8+zwfqU58la+M4lFZ8pQdI1xC9FVxDB2GbIzgXuer9HxKifxdXB0hEn89WvqvSiWH
         RQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857207; x=1786462007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=TxR50q8g/OFasgjQvMEfNXsiKkNzbv6sFIBoyHQSZDbH0wCeawQKHBhjstnJqBJS/l
         bhrItCI2tS1oK3INaHXPQJcmNSTzDQGhK/T1v76PWemltYE+N2U7Q3uIXI+YaNRu4smk
         TpeUGgVJcSPBKdxJ726++OzT9Q6X7Hfv1fQSNtxBMcKjx5y4JPxFhe70R8f8NdYzlNd/
         qLIslCf8rwNOILo19VIh5IXYqdRzvOZAr6GZhyHhynLk4/B0mBem24bU00oRUaE1v8GK
         kg97d+hlLT6KmLr2EyYWrLD6lwQ12SRXJ5vYYHaUMCR69Fm4lzAcEKYmHk92PwWif8Ed
         mstg==
X-Forwarded-Encrypted: i=1; AHgh+RrdIfCRrsYL/o8fjPlz9zpaV1u5Qaxqb1zhRj/H76ToIPwPSckIV0ztPqD503EwP2pi0dY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIPIV84XDD4bj+qvMZ5i9aAJr1zbf7GtWb8xiRzgowiMOBiI4Q
	nyGQ0VY9sViiRVyhHUmj9w8F7S62fHxn3pyhOMu3OMpF6xc/ri+kEEK57OA6twXPAE1zulj/1Gx
	8CxezZ5dUXIcL4ffpKJ/6vhr8Y0VZkG0=
X-Gm-Gg: AR+sD12YtjOtjCJ87IaiyBFWvA5d2vMDMSlDtCyyXQvFtz9FWlgbzQh1hbqly1+zD0T
	kGbKfm7CRaJvxbwraw/x6KBJzBLpBq5iko/MorQPbmG/3Y7+CjhGcMIQxpg7YrU2PCzlKbZ2Pdr
	JetEhjQU9aScMIyy0pJNmUEf+J0uMxBWWmK16x1z2Q2TpBOy9Wjkg6QTqsmlNSrZpZTFrjXoZ3G
	W+x03HsoCVAgI3K1sMwRfTpYRGKvsEK9RmbtqzLPLwfMvhKRs/auEjsgl9H0QMxk+t8hreovMiy
	PttUVhA+ttZVKtwmRYdA4Sg5D574uM81fp/Sdco/TaJ03u2tWT3fnGC3zYBTkNPU1Mt37HO7/rF
	4cIM00K6WrddBl/OUt6+mWyl/TEfB5kEwbyFG1JZJ1QGUdA6UO/YTVhhjI1S9hIYFTU2Zxu2RAO
	z/w8RwcbmPXjOOL+n1zcaoNy1GuguBOg0nuyGR
X-Received: by 2002:a05:6102:5093:b0:740:2717:a1b2 with SMTP id
 ada2fe7eead31-75b21a600f9mr11149553137.1.1785857207439; Tue, 04 Aug 2026
 08:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch> <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
 <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
In-Reply-To: <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 09:26:35 -0600
X-Gm-Features: AUfX_mxUgphmHVN2nVqeDHtOoQ4DhYlfN2EUsZlGA6OuEq-kXlUnQLFlQtbWoRc
Message-ID: <CADvTj4qmXWbDsc-vigcSrF1N=zpxmZWGp3YaZ9PFcWK551h3mg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
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

On Tue, Aug 4, 2026 at 8:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I agree that the link PHY cannot be identified by reading its
> > registers before the package control sequence has run. I do not agree
> > that this means an arbitrary ID should be placed in DT, though.
>
> The ability to put the ID in DT is there for two reasons:
>
> 1) You cannot enumerate the PHY because of missing clocks etc.
> 2) The vendor messed up, and did not put a valid ID in registers 2 and 3.
>
> 2 does not happen very often, but this is one example. They are
> different PHYs, they need different driver code, when you consider the
> PHY as a whole.
>
> I also wound not put in an arbitrary ID, pick an unused ID in the
> vendors range.

The value currently used in DT is not arbitrary: 0x00441400 is exactly
what both link-side Clause 22 endpoints report from registers 2 and 3
after the corresponding package control sequence has run. This is case
(1), rather than case (2): the ID cannot initially be read because the
EPHY has not yet been clocked, configured and released from reset.

The reported ID does not distinguish the two packages, but replacing it
with a synthetic unused ID would make an ethernet-phy-idAAAA.BBBB
compatible disagree with the value actually reported by registers 2 and
3. If separate AC200 and AC300 PHY driver entries are needed to identify
the complete package variants, they can use package-specific match data
while sharing the common link-PHY implementation.

>
> > Both AC200 and AC300 expose the same link-side PHY ID and register
> > layout.
>
> No they don't. There are extra registers in different address domains.

The block diagrams make the distinction clearer. Both diagrams depict
an EPHY block with the same internal organization: MII/RMII, auto
negotiation, auto-MDIX, 10/100 TX and RX PCS/PMA blocks, LED logic,
clock/reset, PLL and EPHY AFE.

What differs is the surrounding top-level control path. In AC200,
E_MDC/E_MDIO connect directly to the EPHY, while the package control
logic and registers are reached separately through RSB/TWI. In AC300,
the external MDC/MDIO pins first enter a top-level MDIO slave and
register block, which then provides internal MDC/MDIO connections to
the EPHY. That top-level block also contains the AC300-specific reset,
clock, I/O and eFuse controls.

Therefore, I agree that saying the complete register layouts are the
same was too broad. The packages have different top-level control
registers in different address domains, but the diagrams indicate that
they contain the same link-facing EPHY implementation. That maps
naturally to shared link-PHY code with separate AC200 and AC300 control
backends, rather than two copies of the common EPHY implementation.

>
>         Andrew
