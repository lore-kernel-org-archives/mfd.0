Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62758355F49
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980224; cv=pass; b=Ke5XJYkFIp5ajc5F9KQrTZylLy3l8TByjnkMrutSz9iws8uGlu9zAWs/qJ2n7oAjgRbyPD34NM+trOeYB5yKT4HGZV2Gse1O/3H2PrxcN1iQiFgM+FeY2Bj1QKvtkLJV1UpYzRmBwQhqKzvuM+9ALm8w5Y1C9orr+YoZAGjOAJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980224; c=relaxed/simple;
	bh=HRyDszTddmkegZPbqbF/UibEB7wszONa/Wg5VtrCDCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvviSatg9u7IimGo6gnffSlb0qUidOjeT/Ul8mTF9eyaQx3o294755OYcGAuAp7Zaq7sKGadA15EC/myuiUQ/A7ZlOxqBiiX2tMt/5rzZj0MEn6HC3+GC/jGjLcfMnEcxYQJFyjupPHzLFOG6/W3R6LRqMR1EgjT2kg6Bpmr7q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa8OgaYe; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa8OgaYe"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso585215e0c.0
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785980220; cv=none;
        d=google.com; s=arc-20260327;
        b=NLVXl2Mn1fbt9S3QgbY7g2l5QzaFAtqHSy3lwKg4pLHRHSa9V2bo8EbyeNQSF01zrA
         ZpgybV66xSqVtjqXzKBk1OlqD6Ld9oVvZ04VQz7+hwfa/VY3hRbLTJuV4bUGW6IPVdbU
         G/M2aKPlByhasy2KjOUeW0igCjvrRS9aREIIoQRwkUoxNvfNOKNkkBg8iddEZG3sKsK4
         xQspF47fIYkstv1O8fHs1iK9X6EBQLGs8rwSwF+PDwJ/kjVI1c0W8B8/UslRmzT1wTpz
         FOJIsGzkfgtSAspFntmJeFf9bmXFmxCEC9mAZNefBrYB4ZtZZfFbFoMHvCz63tdX3lwt
         Ph+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        fh=Oqp8eQfm9IC5ul7c/q1XIOiWhW15dml4TFL9cc0Nhac=;
        b=MzPdq1qvjp5dhmlbnKZ+6QWhmPilVeEm/Xkx3ymKiEZY3LtrbtkvXXss2eor+uWeuq
         aaXVxfa0YSZgBEpoNwZa9JV64uuYbdTP7FTtnLUOt/hWqZSOLdqxaxz+p58j6q8kjZjv
         UVoCza24YBWYQvH0gk4cFwSU1EGZ8XlAfW5YoVFxsfQUrQ94NlBZX786KHerM8h26And
         KT8q4mIry/aHzNFPm7JCQSaBJ4+OnrKvGBZD1cRdYy3ad2RajyRbEvUrGYm7ktNRfbKc
         JFFiuPsTYbFZfT/89OkDQzkcHHn8j9MgKik+F0b770C/rzu81YoiZr6KFaH1N4Q6bRQX
         RQ4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980220; x=1786585020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=Xa8OgaYegm1GGgHF9ypL4vVBO4fhdieh4i1MJNcctThMZg/xpOYfjt96Sd00vYrBly
         FZGDwSh9/P/XRu8V7q0AWKqe0tjuhAKC8gxLzzS12lqfM2enYgHtiMV1V9SSd5tOXl5L
         Ma+WiZJB668ZZyfuTxyakXRXy1zA+BQip1DAKTNBBBwXmNLFekmeO7aNqGJQ3uexV7MA
         fuRNKC9TVbSOpan/WR+9ND03DYtVU3zpvxEvUsXxEMBsEzr5wEKkwWSXoSwjap/kP32T
         W0TXSKAVGUkNXMM0y4KojyjXBrp1L5AeAo0q/Isy0QmXb0C/s4C4nT9wvjR6MCy+4nDz
         tcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980220; x=1786585020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=cU4VadKdcrDWjjd8GBTIvvHjpAwx2qu208bq59IxtRqwyAwensFP5TdFFTagU6r9Qn
         Gyr0mV7k2i8Ix0Y6Bczmo9pB/i1JjWFntM93ivRhxppY5p3fQ0Ov4p7kTc1q3yKVoEq5
         WUqi4ZtuXh5AbD8OAhob86kj1NHmI6LVmQV+BmgealYNwx5RehIC0dlxUbbncmTNOSao
         6CzagYjnezStaeInvfb4us86oJwwqHSSgWjm5gpeUFd+AJD0TDIvOLQMOlMBF3NYO0DR
         xsfwPs/Spo8sL1qDCh67i/ZkduXRoXKMveDlk8BK1X2N4tNBVHPjLIlTlRHsk8LIACNl
         3Z5w==
X-Forwarded-Encrypted: i=1; AHgh+RoFpVEnF6KBRV2YoV0SX1qjg7yHv3h5ypMGQzjR3fL+M3c6Tz74FolA/bd4u4ojpQ/jzUc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2K2MKxPE+o1iNDt0gfgZABxLOIuhZU0+XqbyHElwwy9bPH0lY
	CnqMwikk0zBIdzY95YG6mp4wF1x+Zf5vIPaZZysQ0Nu1a3X3pHEoQvQpGPAwKmXE1Kkb3UyD0Q9
	iDWSbo1gStGceFjSSEwb/r3QIztloul8=
X-Gm-Gg: AR+sD11WIYi/IWJUWVSoKkbHKeFC9pAL+h+etbDBTmG+w6WgjxcJLFpCUv/emPr6fZP
	eIqBkUSUNqhOyMsYRzflNNn0HZaZ0E/uS1l4Hg3NJhRKc0nV6idkAHPlQCUbo0So1BPcwF0thzA
	b3A7+9puX5nqujScuZCrXO7bz8h5dB3bsy2L23vG7fNGhfya33y8VVallzorUTa9Y47HSGT1BNN
	GhVlQChLEHOn376ncY1xKbLNk16KYsP2HCbjAaPQT6/prB1hctBh972I7/Mn1ThYriSI6BLJL3K
	D1O7AJenbg+ZIqf4m7y8qEt/lw24OH3CkclQfNe9EYw0Ltw/Bt1x580WyJMXBlhoXfFqX11pzgg
	MRdeAEL/lpM3M8wFOUJ5ClbBiSPP0syCvmQBggRTMPRQoT6L4FRvRbUwFHODfrpMtGb5IPZ/gJu
	pj37OhIxT7bTO2r5V6WXkNvMm5LcX1fyzzKYCU
X-Received: by 2002:a05:6122:4f8a:b0:5bf:bb66:414f with SMTP id
 71dfb90a1353d-5c3d93a8410mr1586273e0c.11.1785980220218; Wed, 05 Aug 2026
 18:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com> <20260805141737.GA715959-robh@kernel.org>
In-Reply-To: <20260805141737.GA715959-robh@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:36:49 -0600
X-Gm-Features: AUfX_mzQwafoGswTs6dpUFv2c34FSJlAsZ9bjOHCBKQRghZLcM4QQZUZyorkfog
Message-ID: <CADvTj4r7qwdb4+-k11HD7d_8kYhJX3=XE1ftaRKP+-xpSiST5A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300
 EPHY control
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 8:17=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 04, 2026 at 08:27:03PM -0600, James Hilliard wrote:
> > The AC300 exposes its Fast Ethernet PHY control registers through a
> > separate non-PHY Clause 22 address. The manual defines that address as
> > the link PHY address plus 16, giving control addresses 16 through 23 an=
d
> > link addresses 0 through 7.
>
> That's not a separate device, but just a second address range. You
> should make 'reg' have 2 entries.

I tried a different approach in my v3 using ethernet-phy-package to
instead of ctrl drivers with the AC300 control address specified by the
ethernet-phy-package register(internal it's doing a + 16 to get align
with existing conventions).

>
> >
> > Describe the control endpoint, its required VCC1 supply, its 24, 25 or
> > 27 MHz input clock and its SoC SID calibration cell. The actual PHY
> > remains a separate ethernet-phy node and supplies the MAC-selected
> > interface mode at runtime.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++=
++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-=
ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.ya=
ml
> > new file mode 100644
> > index 000000000000..8a616ff3e89f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yam=
l
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC300 Ethernet PHY control interface
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +
> > +description:
> > +  The AC300 Fast Ethernet PHY has a separate control interface accesse=
d as a
> > +  non-PHY Clause 22 device. Its address is 16 plus the address of the =
link PHY.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac300-ephy-ctl
> > +
> > +  reg:
> > +    minimum: 16
> > +    maximum: 23
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz=
 and
> > +      determines the corresponding EPHY_CLK_SEL value.
> > +
> > +  vcc1-supply:
> > +    description:
> > +      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog fro=
nt end,
> > +      and internal digital LDO
>
> Sounds like this supply and clock would need to be enabled before
> accessing the "link PHY address"? If so, then 2 nodes is really a
> problem.

I think having the link node depend on the ctrl node was preventing
issues there AFAIU. My v3 works differently though.

>
> Rob
