Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9160E37C106
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 22:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561948; cv=none; b=h/Mk6suFS9Jtt7XREBTxkruFjcWrXN3uTm3kcuSkjhpWKUCQiCuEoL8okgREhVhzkWD++ACKWn4aAavnkaFwzsQl1CKwzuL4xV/nRR7MloAcARSHE9NF8xjLo74cOhFVyQHIbRCIE6gSomEu9U9GzbRUxa3RWGOsc7b7fDTcgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561948; c=relaxed/simple;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZ5a752KOehiJK1erBz83GV6iJX/HY8vfmRmI+G9CapK16rd38hXIbIHuiTA7yuyaE7zHTqMAF3dFtINFsvrhUnK4qnM3Rig4HI0zsKTAixblH2rYn6X924IaI8UJom/M3qQ8Zja36sqnPCxO83pgzThdEKPz7L4ZunG59rEwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVI/mE/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVI/mE/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7833C1F01558
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561947;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jVI/mE/rXo+KMPVG8eTlFteEXlYEFcXnEpCGJYUJ0OeuSkQzhlR5GBgQJoj0jpPSJ
	 nfjXuO6zPB6jjmxStvbvSzObckbu3lUSpjgzITpfsiL9pVRujBZmQW1qnAdatWO5XW
	 cngHWOc4Jb7QkUHa/2uts9Y8tHkZVlUvsRkR45YkzXkXMx8SHQKaZrs7ruVevXxgej
	 0S7NcZtz8gGLh/tUW3eAUUIDPchoNezybVQByX22dHYPX5jFRgm5y23DOzfvwkRDNI
	 t8SDwlMBTOS/YNXDbIjXuGFJXOKxxUXDp8Gv5ZF3gRAuy8QoSWHvfJ1GA99znB5+FM
	 OZBTTZux/TgZA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a20c95e412so14287931fa.1
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 15:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw282NpQ+CTyB8wxlCY0P1Ubg6J9AEEQvR4asUt5IOaayifC9qZN3OCf0AOoyVbiLB2L4g=@lists.linux.dev
X-Gm-Message-State: AFuF++n/oo60SgOtQ0BTo78jj/KriYSMi+h5FQkoJAP3ZNQfmxJt806D
	LSGTCyM3aiqMfHfC87tMkTeXQuzyIF8m+9s7mVdEIdeCwMtXV5WdD71RxvOKwBg/ivzBXM3jSCs
	uaPiUFXxtDMtb0a3mh8yeWSOrL1HFiWk=
X-Received: by 2002:a05:6512:a84:b0:5b0:eda:de26 with SMTP id
 2adb3069b0e04-5b616f2f892mr1623422e87.16.1788561946156; Fri, 04 Sep 2026
 15:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
X-Gm-Features: AcwNN1V7OH90tc_RzF9sI6MD1gO6FdJaYJCKQoqZfbOtKCReNgI1EwM-3lb0Rkg
Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
> console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
