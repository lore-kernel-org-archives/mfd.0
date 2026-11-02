Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605838;
	b=kzVWqpBAH0MUYVGmGdyYqxGkvTmQvUN0old2HdhzykzWqLCsKY6KneXOa36Vs/0yzTO1
	 P37vZW4f2htgqgn1FA1iNYXTcfNmMuJB/U1i/hLG/sFgThwQntOzMctGQqMBHf73Ioj21
	 0niF/3OfmjCPILtsHWpHucaaNHSi1Vh/mE6d24a1jg00AtD0TTwJ92uxUtdnRB4n16wwI
	 qBcZb0MzXLT0Xh3ynKBzyFLJjbkf2vNwgwF0OItkXakrCrjkr/+7yvdrfpwm6AxvwvRxQ
	 GSI8efDpmQuQ6RLEJi9AyerBbfZ1lKzfPmRwrUhJQGxf1VcN521WGS8BKljVYrlsHpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605838;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	b=Fh09Sm/3WrAAj0vTYata8mK81w40lAMWPvz/Q/eNcSKFjxKKn/mMAg4pB5srvKh+vbnb
	 r72WRxzg3Hxnffcl/UVXKa7GdtNbJEKeO+wJhI+y6Bor9bzU0/TA1P9XuoBAex5ft+hcH
	 KV93ulqWZvMsbmK67gt3N010BOJmW9tD3QWaJ6FuHDhj3TkBNFJaGm8l6vnz0mL95Hleb
	 ka6/FxVzMw8yr3/NQrduA15QEjXiNBpHWwyG2hSuyIFsGtpvfwHDAQo4v/U5blLfVeFLl
	 rgT0ir2MBOtaYEUILp2FKvXW2nUrFM8eBesKBtM0VB6WVN2wTg7bhxFQFGHnvAhasMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kouic5Ck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B77606A324
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kouic5Ck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF1E1F00A18
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605838;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kouic5CkKUn0X0KnSs1wuePb74UNjNwda3bpX00QX1ekyyxJ8FwaWU3wP6Wy1IN/B
	 rAMHTltmOUpaLKipGg6UXleSHzozKeNbk1NWDAjRo0sgHfjHsyMhSGhH6iO1dBVQ+x
	 O3wh6WEDtQyTPj0Tk8qUxscxwXYPtvvQe6M8/etT2g8vmZnAJFnozckVUM+UA4Nt6Z
	 1/3x74j4R85qqXqkQiW4oTvR8nkZat3STfaBOBrP0wQvpRxp0PcWGp/04hHE2RjGls
	 nxRAMLaE6uXGmcoOdBRq6nilE9wX4yZbwz12Gq+UJ0a+bbyBvZDW9XdMYF1JV0TsEM
	 mbsk19b5t2r5A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2543242e87.2
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 23:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxeHJKTTDur77ADCYXOoe0ey4Hl40FmceMipmvOfto//ekPh2EGDitFxYsfHs1haHX6tyo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8iXEproN02mBg+jG4H4V+9NQOZrf3g5DgM3fHv7Xq6Pmw9NGUN
	vR3aA/LXAaamIbtzHnTv+UGm4o/Rj+yw6NgpEUAM0v4a3fFGeWTaUQT6+MJnuO/bDuuSDZ2e/rK
	h/wpVCA/GDHlL67H/vMAkjILOLgfEQ4U=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr2897713e87.24.1793605836758; Sun, 01 Nov 2026
 23:50:36 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org> <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
In-Reply-To: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 08:50:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
X-Gm-Features: AclHuK9dC-mcHphjDYNUk7hAmH2idhA5q-arw9O8qj4lPel0YZKSwwgRuar-Ksc
Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> > Inside the PMC is the PMB, the processor monitor bus. This bridges

> Should have pointed this out last time.  PMB: Power Management Bus

I think you did point it out, I just didn't manage to change it everywhere,
hopefully I only missed this one...

Yours,
Linus Walleij
