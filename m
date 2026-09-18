Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8733B6EF;
	Fri, 18 Sep 2026 02:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698328; cv=none; b=gnKepAEFpKRBiXSm+cuI2T8aNO+1ev1rL2rNTQFbBhNjsAD33EBo2zk3XQcdUBRY67qqvNUGFyZaLftDxOmns18A/zhMl9g+acxg6g3n9QpDmVvYkVzlqAzRcIE8KpvvugFmYx2CzAW8pk8Rm3L2O8eDbcEtq9ZmP8DXrVzZRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698328; c=relaxed/simple;
	bh=Bn+M1bnYhegYpFtnkmmiaD8EO2kfpNB3REAfydUb59Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fdOFqTL/L/mQsrrvYfp5wqZukQNU3pmT2bevOMDIR1yPPyp2c95McpGwDUj0yCaqEwglWdc/V2YICuetRnFiM6/YG4oeQzGUfqyrB3h3gUP2IUhWdWmGxdE/O89y4iZgvA57wK0xfowoZU8mzzBbnW3U9/t98yjcOtUESx7s10Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV1sCa9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV1sCa9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72771F000FF;
	Fri, 18 Sep 2026 02:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698322;
	bh=Bn+M1bnYhegYpFtnkmmiaD8EO2kfpNB3REAfydUb59Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hV1sCa9B5RU/1ouNuKbwYp8chwV4spIS1JeNgjDpqJvOoZxNKiN8/9sIfqP8i6OTn
	 odEJo5EX7nUdjS1O5xnmZA8zEqoLOuCl4OhZbXuRhi5Vq4JdgNrf+n8u//6AuPp6vW
	 LfLpCAuzcRpGMNgZXwKLQDSQHSXEiA/qRCycSel0gs54Do5enGug0FbhMltDEpL3+Q
	 3W7UxNJ2SYuaaWda9hlbjEoERsH4i3j0rGjVHQ4zrMA/G0RdSc4rQ+ilsiNOML/qyQ
	 XdnIaQKBZA2q/h+iKncyPsA6DaBTB39IHHj5MxKIil1bEZOJxkAUY/34WsBbAwwm7S
	 1u/4IJV0QZHVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6397 PMIC AUXADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-1-db35882a6080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 02:25:22 +0000
Message-Id: <20260918022522.A72771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
> and battery temperature measurements. It is not register compatible with
> mt6359: a conversion is requested by writing a channel number to a select
> field and pulsing an edge triggered start bit rather than by setting the
> channel's bit in a request register, and the results live elsewhere.
> It therefore gets its own compatible rather than a fallback.
>=20
> Add the binding and the header naming the channels a consumer puts in
> io-channels. The battery channel is named for the input it measures,
> ISENSE, which is what mt6323-auxadc calls the same input.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-rbrue-suez=
-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com?part=3D1

