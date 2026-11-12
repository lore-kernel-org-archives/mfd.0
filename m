Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442639;
	b=VdGlFlQ1hhVOwhlWE7/lzYCywfMJmnIEhIOd4HnSEOwhBmgY58LZktRtPu+VsCGC2N7m
	 r4YqaUfOjW9Z9pa3NWnmpO1B/gVzSVnM8g07djVACEFBD4NBY4l6rEQ59MQbpCmq5fEwD
	 B3je67QglPHQHT42YQKDZipxgBfsim0+ThUr3ktAa1ia5sMIRNgsHFyddCYLEaLOWD7yk
	 5Ki5n/OJpZSq9sbnjlEaJTKTEpnKKFMYwMkLpp3JrDEQDfhfnlSv3w5JXJXHkdNqLq75N
	 jGEXkOZi0NJX9XWkgMDgHGRgRdglyN4gkejKhjV5OzhDK1TZxyjx06H4pb3aF6xSJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CP0CUGEzZ1ZsnE+QQjzjTiciGHDCNBTaBkgV2aIGgtY=;
	b=FiEFE/STfjNvWMH9lu1bUGM4anMV9nQj8Go0dxD/qCI1A3LfHLHI2AEUyfz9ntkQWQFS
	 DJeUSolV4vNbEIp+x1wKnoxrm5z1yD5AvqS2POdcX3ULq3TU2HFOCl2jXE3V8U0bn1v4K
	 vphcoaWGRVL05LdFDuFgCQNJbtmRvcsDiVBLYTflBjna5CJDzZokqcdD63fNXyEBHdFDq
	 GsKtVZXz34UPw+vS1300v0m1BBJlnpZ0BmHJO2EvAi8QS4LVh+nR+dCRCZSXEfDaXwjZ6
	 C6OijtOgbOh1vt30ZOgiCzEh9NTQ1ks23nl3X790bhKad7wj5YOYlrkjJGtn9rNf7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XToggzbJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9711606A326;
	Thu, 12 Nov 2026 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XToggzbJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD691F00A05;
	Thu, 12 Nov 2026 00:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442639;
	bh=CP0CUGEzZ1ZsnE+QQjzjTiciGHDCNBTaBkgV2aIGgtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XToggzbJ+srPT3wGOKXOuGx/F8u1mVhSsrSydRbXoF6VrFkhHZxp3lKPVz6dN3jfw
	 BOqXNgggCyA2xHreigzOch6SWoqd9bbxnduj+g6/xq+MBvm9T7O2S0ZnD9Fp83k1dc
	 gQpPz9BBxmCe5L1oKd5ygodpQ4psbi6ZcZulja7z1wabKn8SN1RiDCZDQkuGbJZRY4
	 bTvLOONeTAMB6VAw2JhCRuDynj9H2d15uBpfJHX3/QHINBXN5SThZ/wcaDuGH75ERR
	 dHIbWqY5nY/4YvhGh8CQPwXfh63pjl5kyNmXjVXMlpBnKZ/TIYYXFt4JYxF8yu/Q42
	 3rFGiKlovsCCw==
Message-ID: <sashiko-outbox-209895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add
 switch fixed-link
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-9-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-9-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:17:18 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: marvell: missing Fixes trailer for gl-mv1000
  fixed-link fix
--

commit a68eb6dc3b861d90e5a107b8b38a297faa592448
Author: Rob Herring (Arm) <robh@kernel.org>

> arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
>
> As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
> 'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
> The expressobin has appears to have a similar configuration, so copy it
> and use 'fixed-link'.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

[Severity: Low]
Without phy-mode and fixed-link on CPU port 0, dsa_shared_port_validate_of()
fails validation and skips phylink registration for the switch CPU port.
Should this include a Fixes tag for the commit that added the board DTS:

  Fixes: 6d5a6740f6df ("arm64: dts: marvell: add DTS for GL.iNet GL-MV1000")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D9
