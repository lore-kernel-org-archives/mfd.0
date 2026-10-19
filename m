Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7573B27D5
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385900; cv=none; b=KIN3EpoUi5+TDOONOn6P1rv8XK/R8N6Rt4LJu/rsthiTAcZ6O630YXhMv/9ApwFotMyQnMHQz3kK98ACrgu1grha0Z3ZISR38Y6knJoW/hIYRxqJivLdb8eu1RrBpiyPh4eL7s8NsxrPNq9E3DIoCcHKQjY3jgi6Xm5B7bBCJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385900; c=relaxed/simple;
	bh=B7erfpszLG16sr2x4LkMr/la6fiPRRPgPiKZHfW71Zs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FbgIRUrEqjCYx0CsUBYN5MzlpWoRGouKJaLjMex+6LPGp1uFSbHIA1zKjGtGf8kQLJiGLpH3eW5T2c/ZNrp40M1bojyOV4P5ddUvwYZ5Z5wKbQoJvrh4UYSGKbvd1ousW7nCPlIj+/bkutpagi18/5/XFmeGPkbA49MQ1oo3EXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ4Y02Yo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ4Y02Yo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B71E1F000C5;
	Mon, 19 Oct 2026 04:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792385887;
	bh=B7erfpszLG16sr2x4LkMr/la6fiPRRPgPiKZHfW71Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZ4Y02YowD/RO08tKS/h2xW+vWLSK/Iy9mv3XeSzQU+thmWo6LIZ1+N3TdyXonC0I
	 DT+nhdqhmJz+J+G/DJ12l/06RDxcBXllVAkL3WHNImz1UChfcELd4MUDlA92z2X6ym
	 tkeNWo4KVbFZBVGv3+YtLZVGMWiUDktCiSrR9mC/P7aMNWE3+W301Scwi1l/1La0Vk
	 hQxzli+F3kjtzougJyMa+GELKh0DrI9iuMydzkkRctk/XbNUb+C1NIbWsRGIbGL5Ci
	 Kv1QeRtvAuLWTQSjiJ5A5k4TEOqfakpW2BFZIMy3BOv7/bJThWYwLkbKQ9mpkwvaD8
	 2qN4kqQRpYLjw==
Message-ID: <sashiko-outbox-176655@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/5] dt-bindings: clock: add Ambarella CV75 RCT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-cv75-soc-v10-2-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
 <20261019-cv75-soc-v10-2-d386065e2dd5@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 04:58:07 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Document the CV75 RCT clock controller and the clock ID header used by
> DT consumers.
>=20
> Document #reset-cells for the RCT reset-provider role. Soft-reset line
> IDs and the reset provider driver are deferred; this series has no
> resets=3D consumers.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-cv75-soc-v=
10-0-d386065e2dd5@ambarella.com?part=3D2

