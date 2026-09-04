Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D482D46CE
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561919; cv=none; b=jwnd8gFBRi6zm3t4vPZlxo74EMYVQlXDxZJjYueJyJTcqTOYP8kMc7hER9yj73eEZGdHWdn8qDpZdXPtQT3ujp6kKnOYq2yEprQC+7lL1eAN0SWyTBg/1vKatquSm2n3Y3ZNVWHfiKexq8922dyijY9UX1Tjm7mkVd6jlPbZ+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561919; c=relaxed/simple;
	bh=GG4yiV9DxJza8/EgbLg1Pcje28lQYBQ37YcNHEdzFw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9AU/D5XFw5OxDX8tUDgxUuTElzQYIyBurVRFEw77/U7zWRLddeqO4aLWHi//2NHBoR9xsLCjFJChGxr/Cz6zFZpMFXehh6FJjBl1LXADNZy4/Ih5rE6DZub1Toh0jte6iFU2U1t/hBnX5lkQoHERISPnkLduDD7pW/DHPVhAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzlOQqNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzlOQqNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4FE1F00ADE
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561917;
	bh=uWYUMjGqi5+4yk50gbS8J6hfId+b/zKW8a33FxvQ4nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HzlOQqNc1Evv0C6JqokOkN7F06aYDZZYMxAYA3OX1KMOe2DXzt4Ncbjy0zZ4al3lR
	 Uoo9Q1oafgAwBFtaKwSGI7sAqFK0w1OrESsnnvUmtUxDw5reYXNwlfG4LqFZCjFVpN
	 L2JroJBKJGy4GCSBxttOwyHciYS6FAfrjsZgSmOOmcka7sb2SpyYKMNie5G8ibdj8C
	 hMb+0N2+2NN9d7sURunryOjJaHOfh1Hnp0gQhyFK0tVRrWuylhDE1CwoaWt1VStb65
	 bbbi/bcsI1NiIZLyq0Ch4HhY3txmOccuRVZR4K8evDbT+f2ENwmGViiZ45ZqVmrmmj
	 1js1XNcJckbLg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b159850b16so1492117e87.3
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 15:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+RYOftedBNMzU1mOE/KAOIL0ZUSVNAAaT9JVdnbrkNWFBzvY1bWhxAB7eO32qTYk2J5U=@lists.linux.dev
X-Gm-Message-State: AFuF++msulKNaNtLK9X6EUvW240K971AallsMrRr3QLoyZGt2c63bB5h
	YLQHiLNFbhb7j+RxU3onNBb6LvmlTvMhb3nXECnt6kUXTVRt1SdQOupFaka9IbiuBLDrsaOyToP
	4GsFuT8XlxB+9fIYX7HGLKmIVflTMuug=
X-Received: by 2002:a05:6512:2582:b0:5b6:1a42:7d52 with SMTP id
 2adb3069b0e04-5b61a427dbdmr2174130e87.13.1788561916383; Fri, 04 Sep 2026
 15:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com> <20260904065101.17ED31F00A3E@smtp.kernel.org>
In-Reply-To: <20260904065101.17ED31F00A3E@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLkuLQpMb-peBOeGaaQW3Ab_v2DAVd191=UsEa6HWpHziQ@mail.gmail.com>
X-Gm-Features: AcwNN1ULv-94H7UIBduBUR0idoBBCRH3PFxC8xWrAuyRsnVdRS1-1N4JfQMfrz8
Message-ID: <CAD++jLkuLQpMb-peBOeGaaQW3Ab_v2DAVd191=UsEa6HWpHziQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
To: sashiko-reviews@lists.linux.dev
Cc: Long Zhao <longzhao@ambarella.com>, linux-serial@vger.kernel.org, 
	mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:51=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:

> New issues:
> - [High] Eagerly writing to UART_IER in the startup callback prematurely =
enables RX interrupts and races with the console lock.

> > +     /*
> > +      * Ambarella keeps variant IER bits (e.g. ETOI) set for correct R=
X
> > +      * timeout behaviour. Force them into the 8250 IER shadow so late=
r
> > +      * generic IER updates do not clear them.
> > +      */
> > +     up->ier |=3D d->pdata->ier_mask;
> > +     serial_port_out(p, UART_IER, up->ier);
>
> [Severity: High]
> Does this eager write to UART_IER race with the console lock or risk caus=
ing
> an interrupt storm?

That looks like a non-issue to me: the comment explicitly says
what this is about and it's not enabling any interrupts... pretty much
the revers of what Sashiko says could happen is happening, right?
It is actually *disabling* all interrupts.

Yours,
Linus Walleij
