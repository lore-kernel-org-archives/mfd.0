Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333333;
	b=t3zCVk8FTj11+PSEN8girq5lh+PXocUBtuWcSiHq6fHEIABo8ea8ZlTuB7q4vQ7A+iwP
	 7CnJobIcnq31iIdUd9+MvnHxVBEgdotSbnBtbMBq2F70eRk3QeTBKnVL0C+XFkhG+5/79
	 uTSzugLdJ7OzBdVcpGkU8iuRnB+U65W6/S/yhlcIEpKXSOGLITrsYIr3i1fGkoQjCFwKB
	 aJQ9nFTPNrQ7VLAsoLE3nktiZcO28u0eZoL6ZITUq4NeLUdAlD51HWS2FuSEdQJR6AN2g
	 Px+wALrUjy5h3oE4L3vOBk/o/DUpTaYDJZ7kbCqsl9XFUKZsvDErcp87Q0CQwMEsd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333333;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LerUXt1dcdDTsOXnIBrf87+U35Cj8TUEThbamAj0vTA=;
	b=S9GJplmL1WIH9swR2Ko34i7Adq29W3ir/dFw30zGYZ4FZt3qsT8C3T12vflXEjMJcyEy
	 0X8/vx/lUf4caZlx1cATlZWvmkauzfr/AiLdmzW9Uc7PXqfZz0hAoFhkoTrgPulJRlwjk
	 7vm6EOZRYmZlJgMVliUO16zEwFNvs5CXf1ndIuzCqs3QDs5hbTBOPDtK7qfq1YYvU7Pap
	 fpStYkw28hEKKj9eSgtYpFVbeIl2rLDiPYLK5hhpq3GoqCe9WaiM7f+dOgbWvHxrbZGEv
	 0FmuZifI7HsKsxlcHzbFxBGsjabU/NFtX5U/ygKHXu2zCQYGhjnGL4oS7AXaGsy4rwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKIar7Qi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B78606A202
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKIar7Qi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482A31F008A1;
	Tue, 10 Nov 2026 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333333;
	bh=LerUXt1dcdDTsOXnIBrf87+U35Cj8TUEThbamAj0vTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKIar7QijYrsBUAKNPV3q7SR+3IsTu8EV+oZROT6md4inVE+HkoJwUmrE4LM4dqt3
	 ml1KAU5G0hOmDoAjyBkCNpqE4dDn0+mbb2FinKrEinRoAvNZx+Jspq/gyfGEuBpwEW
	 BNQTEcciLB/kEzYyL1Tw+lvm68q+gFz7AyhjYpoblOk7mA3TH/UIa+Uj1aTHFoDA/W
	 dw5mdc/1uyLnkJdVBuWZjoUfn2CetBmn+9Bgr3KIIyKyT5fcp+KJJm2EzQY43uq5ak
	 AH3S+xQ6qN2VeHPY3xM6/5z/1q5NPxSSz5bv9BAxqcd7pm6HvtVMeB6jRufiaGjEqa
	 jEPQDgzKgEOUQ==
Message-ID: <sashiko-outbox-207533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: airoha: add AN7589
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-6-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-6-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:55:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document the AN7589 pin controller and the GPIO system controller it
> lives under. The pin controller selects functions through a separate
> IOMUX syscon, referenced by the airoha,iomux phandle, and every pin is
> a GPIO in mode 0.
>=20
> The AN7589 has no chip SCU dependency and the vendor SDK carries no
> pull or drive registers for it. Groups follow the SDK naming without
> its _grp suffix. The PON groups keep the working mode only: the SDK
> encodes the driver reset sequence as extra pinctrl states, which
> belongs in the consumer driver.
>=20
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D5

