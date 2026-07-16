Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75C438468;
	Thu, 16 Jul 2026 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223010; cv=none; b=fd6QuDNObbqrtGBpJDRIzu3iBu0iztsswqSyCqBmxUG+I5sJwhOQdI4DYLmxTWp2cXUKKHV3CBsdY/Em8IKJIhJk0Xoquhd1eRt8+yZOCpyaLz7aYCbRGdL9pUkqM+cAnWmYb0bPFXZ7OJrzSX2a/e6N10lUWh0ZlYAff6jMvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223010; c=relaxed/simple;
	bh=SSQCfHZpEVyMZHr8vH4L0Fm48ICUdCzbiFkwB520D0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTrA4BCclNvUmF9dpSJz+zAyqq7fBFReD4XNQR/e2Ore6r/2OnTjB8un77HrZvNt1w44JOYc+zu1kY/xkAN8pgjvBPniU9jLHIvTrSvLaptiSp1wiPhFJYJqN3V+Is6a++S+60I+yJA7eQbt9AyBCf/oAzK+QqnpEIWIa8PnJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVpDeL8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVpDeL8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0741C1F000E9;
	Thu, 16 Jul 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223009;
	bh=SSQCfHZpEVyMZHr8vH4L0Fm48ICUdCzbiFkwB520D0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dVpDeL8A+AX3U7K8VGeda9bet2Ad5pIcRknbt3rCsjWv6LYfX7ehb6rZSjhII7Lnn
	 xiqRyITZn/NeEnjFz6cMP0kIul2AyKTLjre0y3HfUz+T7LlQegFcbKeti7Hh/oefzd
	 D6khnJojpoLlhE82IVsKMEoq9nq1A2Y5OMTtedqOOZdyK9w71yueDHdpKprxWaDHUx
	 HUSWGgEoVZrUYVhH/NK+N9wJukS6DlLe8ymuTDpjxLjqY1UNFZh2KxCn9BoQiXIOsa
	 jzTW/lv7lvPJ3YPkFWjfsNDFK152b5+xLDAIG+PRXYYwBcZWLpXZlcZBQylkpecgse
	 8g3jrIF6eqCvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6589 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716171733.300885-2-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-2-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:30:08 +0000
Message-Id: <20260716173009.0741C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add compatible string for MediaTek MT6589 PWRAP.
> Also update the description since MT6589 has pwrap bridge.
>=20
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.3008=
85-1-akkun11.open@gmail.com?part=3D1

