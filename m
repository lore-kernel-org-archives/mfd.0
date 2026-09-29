Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB45111AE;
	Tue, 29 Sep 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691183; cv=none; b=j7nxx2528Wdq/7YFs6a+aAfI+fMIhX9Cgs7iFKYc2bJUi3MTBoJkwpdRSsN8js8QkbB+dR6LseGcjgs0yoQT684qDJMINZ0octtCD8xPcSb+eqo7dT790pRtvmpmQSacHhW04GYimYaWv+jirLPrxU+1dI9df2I7+Hkvjc1LboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691183; c=relaxed/simple;
	bh=SEjQ1yIo4mtU2ioQ7WEUW7alE6xZI5DN5r18RtGsCXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pva7HKwHPE0knnfW1VKvuR1RMlg+Ex26hdMvz2OLZjVaMIXHa9i5hpLLrR2fmSzCfPOiJ1LBiy6fVzoSrtiQHUFdyyJZZAmqEbEKHsBrnhaMk5PpO1O9w76YGPBZWvk+UUNbp+99rvlFtcrWfob5jvLnU3Z2n9qo7OALuvMKJNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqNaiqQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqNaiqQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6A61F000FF;
	Tue, 29 Sep 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691181;
	bh=SEjQ1yIo4mtU2ioQ7WEUW7alE6xZI5DN5r18RtGsCXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LqNaiqQsujbFIhm4+7wS31lVKYcSlB/PhOJQ5NjjG365YM9hz7/GJcGp5sW3IaL0a
	 SgwqtPesQ5z3gwCBhlPpL6lb3BtzLf29u8fY68OBaJvitCMxhMYQY5dk1R/lacXxhH
	 BaHE5cO8S4zIDSmIBlPZS6lXhmeLIaMiNYlM/OSm8QcPAAqeDfmlYhn90HGscu7zw1
	 /Drx/GTIsLpx1IKQ3wT3t0RODt6aenC0163+/03dLCtAbCIeOta7iFIts7t3Etshzq
	 iHE6Vn45LICNqWs6AW+IhMDstBzlO6BaUa9qKWfQD9PxrmD8KDtLXhVW40EiEfP/5+
	 3bE//j2A11foA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 2/3] mfd: rk8xx: Release the power hold GPIOs
 before powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260929140649.55-3-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
 <20260929140649.55-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 14:13:01 +0000
Message-Id: <20260929141301.7D6A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929140649.55-1=
-yaozhonguwl@gmail.com?part=3D2

