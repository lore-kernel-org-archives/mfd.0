Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D63DCDBB
	for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124787; cv=none; b=aV47w/Y8LsYpvmXeqLziCFGbbBSNHIrOUI7CncZE1ctJVm8wjOeiVoV9N++gIUHM+eL/QusMddtajPqa7Vnw2nye1v2aFVSRvronBczfFm10w0+RgkQtsVfMLygHUajd5e6Bhk3Puf0//yUutcy1YQgF4ogoVpZUPUurEtcxCXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124787; c=relaxed/simple;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaZajK5HCOFY2GcCa+LwfE7ZH0g84afkSUiTMbC0QUqEnkhFSta/vv0+B8ZgFhHBPf8x7lko2TVpH9aNhCkLEThYZyNCjMHkZEjJBvUWkftEkWNrIktXVqQHBjD/Dy83dRjHzLshISgcQaiw82fHp+xpXVNRKmTFI5xO8bMwz6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpOjroIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpOjroIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665E41F0155B
	for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124785;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpOjroIGI85uGUmiGJs9drYoXJhWNmVi4Uu3qGsw/NyvsqnuNvUgi89N9RNfPYAWP
	 AEgu6FA3sfYXpsYY+Wr9HXu2c8CUR44guutkanr8ETQ64s6zPs4Fh46HEBjo8TPYvD
	 jjXR4/BaPP1E02MEgaQLgH9LhmetQeGWQMYLdCcKPn1/lPeuo0vL87iviG8vq5aFMT
	 7BUbcYev20AFu3U5/liiINcqpf2o06mkh1Gpk22RTGdfBkWjXs6MZ2GSuVFHiDCubn
	 dJzb1UguVvNUKib86ajaYHZEAOcpz6oxmJS6n2q77Tm19iJyblR4R/XacjfhHp7Blg
	 IdoWLK+59joQA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1029168e87.3
        for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 00:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVF+KetD78/8zlko58WWLs+u9IyNAWgYlbGCn65CW/CzvBFcLGrJ7+LxBoqT+17R4vSVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwGx9B/RUHxq6j6Y+qYEaeBB9ULrZBbbdNq6DuyyZfXIMiDsYt
	uzP8uzJexEt/YjoxsHig1MvyrKY6ZwfnpLmPaj8b4wbAFWn3pAAAbHS0/WhjoeFD3NV5uXXQczc
	T6cWe6Fh2n72LWFyABuNHKbBR10erP5M=
X-Received: by 2002:a05:6512:3d86:b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5b478bdc331mr681671e87.26.1787124783764; Wed, 19 Aug 2026
 00:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com> <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 09:32:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
X-Gm-Features: AcwNN1WedvW-uebjWVm_0ycL6wQEG6qNIR9PZrbwX20kSbc79ar1YheT6gV97uE
Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75 UART
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	Long Zhao <zl020895@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:32=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the Ambarella CV75 on-chip UART controller binding for early
> console bring-up. The binding requires a single RCT clock input and
> fixed 32-bit register access via reg-shift and reg-io-width.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
