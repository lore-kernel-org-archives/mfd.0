Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159626;
	b=HGxuTSdTu3nKMlmLUETuwNQ28K91EzNcCi8DFWLp42jQsJ5FWOu0soNYfRq4Mo0LbfkZ
	 ydiO7bSxzjLsFBfZgrDAzovCWKBiPolvBqR+lTdthGSOkrDo6vTCkiTfhu46peMKdsOHn
	 ikT7l+zJ9IxMXAWNXRIe4jcUZhq09O0Vmzr+rLjgdkSjf8H7jgggWUFcYLcw41UZm0Ut9
	 ZWoaMmFocZUbnbTRcbrLcovhTYUClg5n9rpBK6MXrApIYANfsKZ/nOhB8MKjOug9mwwfI
	 KT44ajWUsrrQ6BH5JHFvZKhHmqIlWOKcWh1aRmzMdIMUz1nJqOdVesn3AkLJQ16WkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=91bZI/q/c+owmhOtdwwMWAB83xH3H5Lc94uTpRpD3Os=;
	b=mM/r5X208skuItbQL6vgVryWmnjNswRi/Bk9wz3SC3NPMC/NfFkZuba009D9NloYEjCh
	 8WwQZK2ex5Vay0Lj/TkqCwwL/w5CkKSyl4g6JK+O0hoYKaCy0SrtZfzSZrngJiDUx/HPl
	 GTX5pUxZDIViadEyuwz9ieaGi2jEw62jBvlRe4QkRM60TLx8OrrMLFA2P9MBkZStbTkil
	 taJlRk8htur99Y/4XNwfwgKcYZe0OnypUrQtC9ZzYzEQrftp+1XOSlwYr7huuxFtJf0kn
	 oesbzNBy1tIn+/KT4M4dXMn1tL7UbuqByjxlIk9aWOnJnWz/E3nZejkroViolkgs7Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9H7+6dd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D6606A320
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9H7+6dd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235441F000CA;
	Fri, 20 Nov 2026 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159626;
	bh=91bZI/q/c+owmhOtdwwMWAB83xH3H5Lc94uTpRpD3Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9H7+6ddmyErikvzGzv7IrfQspFDlEQ7RDpImcdjBjMeZTyxtctgWHmlSMw8ZRWqL
	 /Sa3TGeiTA3FyqYjvTxt5409CXL8YOTurl8BINySw6RbvhK0/r4QPDsAiYHYflNi3H
	 S/5mjiYfeQ37RppsVC321fLCG7PfIB41Np8zLT0V9G4T+m7AgW4murZ90lsScH/QLT
	 BhwMZI3CDa265YGpchnyoyMJbs9mqwSCUGiOwRORw8loaO8Nr6Len8/HaUtTsF8dza
	 pUnF+fCB6C9FUlko8cgMMoUuQjOII4v9CqyACr5mubhROT19mmB+Uud3+fgNiixPip
	 mgZKvQsoPOhcg==
Message-ID: <sashiko-outbox-224626@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/5] dt-bindings: mfd: Add AAEON embedded controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-2-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
 <20261120-dev-b4-aaeon-mcu-driver-v10-2-a756687e7997@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:27:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add device tree binding documentation for the AAEON embedded controller
> (MCU). This microcontroller is found on AAEON embedded boards, it is
> connected via I2C and provides GPIO control and a watchdog timer.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-dev-b4-aae=
on-mcu-driver-v10-0-a756687e7997@bootlin.com?part=3D2

