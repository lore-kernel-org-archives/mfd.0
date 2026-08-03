Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7B3B6344
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792878; cv=pass; b=u6aCvS4xB56IMLGnKLVy2Ay1kZ1/jsIeu1VlZDKIR+JwSIOHROd/Du7g4LyBoM0OQSJWigltkIROpk3BIbh+JEvtu2mli5KJlgMso5Dz33ivDMDYcXBKPI2SUMD5aunKksqq5G2S/PcMp6xGtUjPu/AhUU/XMci+64qHByFEfW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792878; c=relaxed/simple;
	bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xahb5EGx+/ULXGx6M6fCe93bJ51kp4vCW2K5scNnQjHdrG8e5irtC5jW5LDBKZ2mbKcRQuxlLm4YRvwHqb8kKd80K22M0MHcJ8KYMeoRhnbJsdlbYAr7IQ/+Pzz6/8Y4vrXsqZ0DrJHbAChMLhpNPYjbyLwEliYq8ZPKw3Kd860=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esbtj2wD; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esbtj2wD"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-746d77537f8so2044749137.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 14:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785792876; cv=none;
        d=google.com; s=arc-20260327;
        b=VS3SdOjnJnG+x9eLT6ZafL7sDXFriEsAxXqw2BRNc1kKSkHLYY6ZKtxDAhoP8BY4ao
         R1pZAImb3pyoyn4jBKC8CAUjXKGDTa+qMYb8CzSRzmlZdYV+J0GGz9kuSzEehaOoCaqM
         xO5eFXdp4Ql0+PyH7Y6sMPp8eWy4vzzwc47JBgA1exdCYYTc+spTDjQnwkteWmaQd3f5
         wC1wWft3Vv1AxW6gAoumF3Wzko2LGfE22HZgdG9ZevmxSg2tWTpXRiRQX9Sqit2gf4Pn
         pgm40BaHwYU6zNSq9sd2SnjrNJqrhP7deTwAY3KBSj7rYnsNe0y8hTzOJt4trBlFSBXD
         hdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        fh=/E0bVf2PBFaVhEAHHN8mvwZT0MA9pyq10gE6b2bU7/c=;
        b=FhMGJ08JUbRtpEbx9plCpTqaVJDkp/qBRmaRgIhoi7oNztFdwJAInXN1qU3Y2MC7Mc
         Pste9sYpSsGfqNs4Qsj7i6OiN/mIMxz23SjOfFRIq72hNVUcF409IoynJBBB6qkyluGr
         OvgpoHCvyQ71J9qTkQqh/wtCJgTd4F87R6NJmScCy0YfwweDwWKDcqGHYXAC3dd/xHJq
         PIcwNMzLjiA+R3H/DSLzBSZO9v+ZWfdecFlFBpiXU01Aqzbqy56Uo3tgxMRIZehCfVf8
         AKSS9cOEHdJSTwCH3k49SyMFkIkgWBg6VxHXexY2u21fW/7REyXP2OyphexUdb4zA7TF
         v4kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785792876; x=1786397676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=Esbtj2wD6M0lAauXvCpk0AjWKFWSgbphTTAuTQsIjvajYlaPi/JpcaQOE1cItmPkNm
         JgusaHX/DzSHrkYqHZ4nCwRQYSkSeF9Nw0/cHGsTb6m4Iy8eaja1MBYdNTiQzchK9zRY
         F2atfWLKkQEjU8pnB7C9Xiwsj5CKnppaUECTY5A4tUC2GNcQbJLWz3TJ1qhFllrE4ZuG
         w6BRgxdQuQP0bARQWJwD6Mr1Vr4RKr8MA3oAYaHB9L0xoQrkH57y6gDIv30sBTU/nrI4
         WWgkEvQE450sG1WsC8Kne9uxQllFXbWBCFGUg3m/abFBL28iiO5uTYkaBUVy/MWvYnSs
         yRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785792876; x=1786397676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=i4u7xFVj0nJxDDvfLb335Wwvjb1HEu5p83kvtkdpq1KnFjzwC2IbXwUi25JB23jQ4B
         Q+1n1wkKQpszVF5WuN4jVMc8Lx2/0zRDi8K/9dfXvllbGotzZYS6k5hpWd/NXQ5Azz95
         CuSqYwL0iZ+pvD9fURVf6ljhsNyKYTqIL5Z1CBoTrzTpTGV38iIuJR81hRGKbqPGeq7P
         mWsEa1bDactleojE7GfXjAj9Obp51dwwZCLz4+0R/vBX527qFDZxD06qabOCJg5eWvbG
         c/5407ZS94AxQja5Dy6WbGTPdpI5Oto8fWL9lNi31rDA+ALs5naROnynK49COlHsUa/4
         cGOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5o6zqsf2qg7+QYCG27jvgjGfFAY+iFzMKXcWDQBXa8MN2Yzp9sb3PxZwWpogOO8km4mM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCIKvE4AvCmrRQrcxmFQv9ia1Y3/VT1E0DZN3b+Zb+Pfec6x4a
	8XKSjX9f6z2IUdD9NitmMMMaGzMPVG/mTH3wzRS0MDE003JFQlkKmNiHipJjRnYh9zEDlcuK2WW
	ZKRKzcLM0aOgt6M3OliyHMw0y0VyDcYI=
X-Gm-Gg: AR+sD11ENYifNH4XGvyXxQtD3XGC6lQKe8PGyLpagZ3TlNdYElWgZgXwJ+DwBLknNKA
	ITbge+9lU87KW1AQ5LjBQ1iazIvRdkTodZSum313NFF0ZO0bEOiE7w0vFvhtm5qtF7PzKeTMSrR
	8ePPX/F6AKDMWhZ+GDIv8KtG8v4BfwkRvne/Ttd3LIWx2dNwTVJ0n/kyPZj1bZjYM7jHu/t9b+0
	Wta54dyRINW7trYVgVNdtIhgBGAw9uHCBNEPEDpXdwP5zKbDEWy8kex34looIy7UzjqVqOkoR1u
	9IiFGrl5vCxwzEWuNWe+roYE6B0W8/yg7dy5CVJekYdlxKBQRzdjL3lK9tZgv8h+s/uAvAaPyiw
	7pF/agkI1dky2Fh+Brp5aCsSmw/lDU77hB8Qm439Zx8A5fh7yS3amaqvGbylXvgS4fYNX69P8IC
	ubN0TNwRZ1UQxAdt1QAAK4/RI/IeTOo7fgn9szkOrDnumoIxw=
X-Received: by 2002:a05:6102:c08:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-75b2196451emr9291357137.1.1785792875669; Mon, 03 Aug 2026
 14:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
In-Reply-To: <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 15:34:23 -0600
X-Gm-Features: AUfX_mz0nFlKIv_Mdqu5KdrEqoS_kIvG6t--sSCBfp69bBMk1YT6VypHPp03QP4
Message-ID: <CADvTj4rjXGgF2d9Xm6TmeS2LwaM+O2wFFH=rGLA32y+aMk2KOg@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 09:54, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 03/08/2026 07:14, James Hilliard wrote:
> >>> The AC200 is an I2C-controlled mixed-signal companion IC containing
> >>> audio, video, RTC and Fast Ethernet PHY functions.
> >>
> >> This fails when applied, because you did not explain the
> >> dependencies/merging of this patchset.
> >>
> >> This is THE MOST important information of cover letter. The first thin=
g
> >> to explain.
> >
> > I did mention in the cover letter that the pwm series is a dependency:
> > https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@boot=
lin.com/
>
> Apply this patch and test.
>

How were you applying the series?

I noticed sashiko was also failing to apply the series:
https://sashiko.dev/#/patchset/20260802-submit-acx00-of-dynamic-v1-v1-0-0a5=
3cd9e21cc%40gmail.com

But that appeared to be due to sashiko missing dependency resolution,
I went ahead and created a PR that should hopefully fix that:
https://github.com/sashiko-dev/sashiko/pull/389
