Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057D388E76
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368878; cv=none; b=RmL0i8QKwh3Lb5uc6z6c7MLhKWvmGtA3tu3UeJyF+/3eF3qoXzMEdih3hP6ZNtKzriGclHhgbe+VDcVCXD6yia4Hmwof07Vb1x+jBGeVl7s+owV1f1Xve1sNdiDJ3HF+pPciXLyGrr1BRupn9I/A4u6kfgeXY7ilGbxkTdUP9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368878; c=relaxed/simple;
	bh=gGWDm2ZeXyeaxaEqlTS7AoCxIynkspUa4rn5gBNPKcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqxfUfxfmDsr3LTR9NOvWJp9171cHlbJbfek5QFrWdY+4K9nc9agB2lXElqaxH5NZcjKAPV+OsNor843WnDM2GpDha613w5pZ4gRcrAXhXpjZuMFEAtL+eThebx6ddsqTroXaMBSIAYrFIjg6fRiwFcEu0E0wSs3xptTpwvEDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBEgBwi6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBEgBwi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A371F0089E
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789368876;
	bh=gGWDm2ZeXyeaxaEqlTS7AoCxIynkspUa4rn5gBNPKcA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lBEgBwi6meu/B3jHy7e/fkWEd1HzWkE8TDZEiVQGyevX3XkFyt0amgFE4jWJFcWX+
	 KIQctdJeqFR4ysGMoaispQIu0PAVDhOg0O4QE8nB3q03NESkc85Sw0zZf2KlBGuDqk
	 DgiKts9OWEPF7tYqKMpk8xvT/Ri8n7C1RBso9wg22T0T0GNTFaEtCLF1AMDM0Fs06G
	 Mv9Vx9nOpCooQtkcHKXXEPUVkxNo+GMO6XTFk3YB20FPJFM1MEDzPIJL4Qs6xI17RJ
	 GKz+J0IMdVOSouzxW2cuvqEQ2ShNSY5lTRFBdR2N+bB32FR3W4hFbCQf+AT0xUJIow
	 IP9XlBJyQ/0YQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so1579983e87.2
        for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 23:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywLVsaw7XMRgTXzA/MLBil73vmi0XPXZW+5UqibbdU9GqGjDTRNWsC6UKQ6JKbO1FQHX0=@lists.linux.dev
X-Gm-Message-State: AFuF++mf1B5OT/bL6OBfMaxrlh2IlRtGWE94khnQaR7CwgaTneivHNG5
	fDEtSOTPfmgNN+d38lX8eL2htdzhcybxLl7IJtAYpJrKnR7a1Bu9ypKtlxYnA4FMwzQsYpTnzMS
	ZRtoSrX3YbfhMgWk6Z9TDQoyPdk2X1fQ=
X-Received: by 2002:a05:6512:2c8a:b0:5b0:1eed:f707 with SMTP id
 2adb3069b0e04-5b8ae6b8ad6mr490437e87.23.1789368875463; Sun, 13 Sep 2026
 23:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-13-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-13-fe88b01829bf@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 08:54:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ZtSmLOybqQwG0QFoUyKNgQHELTGwpXqMsXgZj67PW7g@mail.gmail.com>
X-Gm-Features: AcwNN1VVx3rRs-KrFctGTK7Vx-J0lxpkKNaEL87tZvlpObmy5MFsc96ewHo3nZ8
Message-ID: <CAD++jL=ZtSmLOybqQwG0QFoUyKNgQHELTGwpXqMsXgZj67PW7g@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: dts: ux500: Fix up regulator assignments
To: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> Several Ux500 device trees use DB8500 power-domain regulator nodes for
> supplies which actually come from buck converters in the AB8500 or
> AB8505 PMIC.
>
> Assign AB8500 consumers to VSMPS2 and VAPE and AB8505 consumers to the
> native VSMPSB and VSMPSC nodes. Use the common 1.8 V I/O label throughout
> the reusable HREF board descriptions shared by both PMIC variants.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Bindings merged so patch applied for v7.4.

Yours,
Linus Walleij
