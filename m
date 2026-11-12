Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442287;
	b=miUgaiN4IrMKxSyMDAS55tcZW9YPhHxjRbCbP7paciBpPBDbKzk8pGYxDL5+0Li+u73V
	 CUsGA75eg1nYUVakG0a/2lv3fhy+UbjRKy/tTdq4M3TTylxEBvk35Hk6flwQZlIIo1IX1
	 3wwiZP2TdukFBYAp5IVWSXJrLhUkTVOW7ZOzRV80W9xUjVFcAJd6RCfPtlcQmDW+ugjNm
	 IXFsK+lMUpR2m0A/7GG2gVwpq4s5D3LCtdz3Z7aqnMtjWB7pwU8aVKvJmfH/12Q3R0SJa
	 ErFZ7KljXhVNPxRtQbmIgtQ3XleaTmCDqxfBzD4W/JC+2yR+rieP+V7FGQLcGtMqjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442287;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vjOKW+IHSzumvSyLD94e3+qR5ktX5f/3Dl45xw6m6hE=;
	b=XHns1j73ZPbKHbOrfSecqQbdkbP2Oz2kI0F3qQW/8AQyENYaGjC8uO8cJSrHgoCmyS6O
	 2ogNJdrdbtyHylbYquqmDs+sHaCHT9tVhVkbPBxyqah55YvjBdL8KYyqL2wyr8E69S5lK
	 t5gndRIIcV78XmwRrH0x0Dq6TZ9Is50hQjhzbCtTruJ3hTShm/2G5Uf0wfIa1JqJt5/3t
	 fUTvXfEczkiG3xVhoyYXdT4g8ss4x6ULnk8SUkqIBYqPqs6hvmxz5BwcCHJYkFJE6GVSb
	 yMyprJ+IA1xjj7mekqvkSR1BfVokLFmRt1yy+hNuaRLbQzdL4Oe4fYgoh0ny9e6GsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxmAtnWN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E25606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 00:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxmAtnWN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12021F00A05;
	Thu, 12 Nov 2026 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442287;
	bh=vjOKW+IHSzumvSyLD94e3+qR5ktX5f/3Dl45xw6m6hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SxmAtnWNostsHrEs6UiDLI09FTNHfzjLVwA6GSDuHsssL71MgmMEq8f09/nCE4l+P
	 O6NlOsPJDokLMin5wCTmm5GyYcdG3ZDILTdygLYqI1s+vMEmMNEYq1BKNOYaY1v9D5
	 xL75p0XjP+HUVPDsUuEejEQ+6K42t+IkxRWSgHPae7p7XqIgNG2BAC+L3VUS4gDu6i
	 S/+RZwTF7Tr3XwIuYOyyUA+J70CBE6DL0N8qmSHJf/ufPJHhT3VmHiytsSCY4cLtWc
	 NZOURcIzbNHu9n/TSTzhxzpVzj5BvU2D9wClh690/A1wK0qVJwbX6D0KkTsys5dGxB
	 NGoM6P2qpaxew==
Message-ID: <sashiko-outbox-209885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-8-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-8-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:11:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The part has no reset line nor does the Linux driver handle the property,
> so drop it.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D8

