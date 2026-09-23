Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7E457C72B;
	Wed, 23 Sep 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201290; cv=none; b=pAYVSVO4cxaArMjuRIrbzQ/sHDS9rhkoXeLLb+RtfVCIMNbNcgzQJGaR2XPig677AZTWpKAt6KLUBxKltpx+lNgxVN9vwS1lRrbkzpaB+L1QLJBQTVV1TO1yk0H9i2gdIr4x38Se3wn0YwzXqkO2cY37NlwlexH9de+j7vSHb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201290; c=relaxed/simple;
	bh=n3Lx+PBoNJKz59LJb5I1cz6+ixtfBfUpXma7hDSisEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JmjrbKLnQETR+mJtGKVTDp9+JVD4VLw0Dv4Wya0dtYCAXvmHNkUKUmjgA44q6h3cSUZk/0jx0R4hg16RKXsKJlJMkzM9rXPDC+QC5kky/ECoO3IurBN7nqd4sM9wwYrlXxNnFt9uxJ6ZEWgIy6h/3hFpwkEoeYhKQY3wFieOXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=day2Jfex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="day2Jfex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE63C1F000FF;
	Wed, 23 Sep 2026 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790201288;
	bh=n3Lx+PBoNJKz59LJb5I1cz6+ixtfBfUpXma7hDSisEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=day2JfexAzbiQpCzar/pe7DtAWA/rYTWdcwjwqGFAJ5dWfFoibuqX4FtvA4h5gVWf
	 3omizXxd07xTBQ7VwFZWDHYjXyw4YqBtwaCTCKpm2xPO8oKPKaiZDP8/QUR0NVVqSK
	 usVEgwWW3cVBtfzrcMSSdUfxBlW2kJoJnyClKt1amVgNxq0k+56jZDfhvB3QHExnrY
	 92e9ly2CebnnkcHl17aEHErAVeoja+2+YJt5iCa1e2fdGjk+nfcsHmi+hUlwS40iTH
	 BafIMH8BZcvnKoSB41f9sdjrIaSznb7l5lTEHX0O/AigA4IUcSbHStEnnsvezNXprx
	 f75xqatpSl6rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] regulator: dt-bindings: Reference Tegra
 regulator coupling schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-ti-tps6586x-v4-2-6c7a8fb8b646@gmail.com>
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com>
 <20260924-ti-tps6586x-v4-2-6c7a8fb8b646@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 22:08:07 +0000
Message-Id: <20260923220807.AE63C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-ti-tps6586=
x-v4-0-6c7a8fb8b646@gmail.com?part=3D2

