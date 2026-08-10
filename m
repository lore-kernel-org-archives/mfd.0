Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BE39793C;
	Mon, 10 Aug 2026 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345856; cv=none; b=mBV51WrcyyAsvio9yPm1ET7FrM+Cj9NdqHPJlpP9iiqgRBb+ytOoPEqr36xm2E2xON/oYqJYDOjycQp2XhoQX9TziHUsUb6mM3cdmA6KJenOqqWMcEOh1p7yFFS4XlOXebRDeWe4od8xPOajSVEyRRlxwsC2iKcmwb643jB9b3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345856; c=relaxed/simple;
	bh=OT2Gjc3lqg50LfvKVjTQEq3e59PNvmKA6N+xyFJukmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UtYOSG+R3klFzqrmybPgeN8xfYzgfJIEFREhteSPl2USco9riSV58SkFeAlwH2m/22+8P7qDpGGn62hotHRNsPs+zB9HFJJsKdZe5/NJ/38dasWpJXn/Aq1D9Lze2QoIXSi2jd5gPjevP+3PqMSfpUFMC2WMI8DXbrQ2z8AbHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opdBM6i0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opdBM6i0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B941F000E9;
	Mon, 10 Aug 2026 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345854;
	bh=OT2Gjc3lqg50LfvKVjTQEq3e59PNvmKA6N+xyFJukmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=opdBM6i09P7i83vT0NBeR9kKrY8JeAwVEEs+0ejwobo65F/fWVkxg/3mBNtaIEAfd
	 nKib2WtF4w63c5AHkmxhrzxAIZatsjTMqdfadXMKT0lD6q7F/2BdNdmxUVSPYMvu5X
	 JqXeBZglWD+6RLyolTR6I5jqfCWqb80kF3wXMGrt/9wufLYFwJGGYvBSmQ/EdZyUam
	 moiNyzgw9oBAMJGw7kntA3eHRktg7U4VcS29PEwdtGU47VKVPs9WQFOKTFsDm0cz9y
	 v5hlH0yusTQqHe+8GNYLZCT99hlSWPnHKXkhNnMFGM1Qopwos69YSo+h2qhzKDe7y7
	 AljeE5Z/Af1Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, lee@kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-10-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:10:53 +0000
Message-Id: <20260810071054.67B941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
>=20
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D10

