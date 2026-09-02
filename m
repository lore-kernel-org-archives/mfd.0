Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95849CF32;
	Wed,  2 Sep 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354311; cv=none; b=hxcJsX9i7NCBcCEOhAEvSusetH8QjQ3FhcQ1GuQVqz2F3eaXK8zovw6DGrrdSFGKlqhs+MvU7FuCMQSL5CLsC7BL29whRsIQHHa7OuGByjip1fADh1B2P6xnQvSET9M1CyaR5LxGz4C3JTYpaA50kuFByGSTiUEUgLFIo12oscM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354311; c=relaxed/simple;
	bh=XnZBeqh8wjBA1/H4GR0P0qnl2Yr1HAJOLP5tsxUluQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KsO0QfVbIatsiRR3s0pnvrIR8DUvqo+D3W62qKjJekApdA1qALKW7o3vZeli0d+Y5CNqo8uecKSMS58Nxl2pCfcbbfL00rDbFRM+KfJ8w91i47giT/SRbEmOHCe1o/M/NYkyJFJhkJUbKvlgzc6KmumdlPslOCBnYksHX9r9WNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtMxO0HV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtMxO0HV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5101F00A3F;
	Wed,  2 Sep 2026 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354309;
	bh=XnZBeqh8wjBA1/H4GR0P0qnl2Yr1HAJOLP5tsxUluQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtMxO0HVFs53aczgZ4/4fkqADCawKn7YReX2pp8d19/R0vae4XtIRkGnV932nRMxV
	 2nhSh2WArNny6TQeNBif2JJuuPTHzzDKhq3dTIA7Vg+mOJNXlof08Ok+1ira5iUHqE
	 5hXCebM2AAfMASoA45jKXx6D8cMc3FwZCupcG/uodjeOQQ4pBJ3vu2UDkI1yGpxth+
	 311cTnAHnl/7ePyHLUszATgrfSjC7xhZhvY/iUlb+W4XFblgainDkuZjuQ82PpT88t
	 ps7HLFgPONjPq4EIE8sF776b8o2LJ+fDu9iqBwGc211jxjiWZ+1sW7gwBH8wZJC6GL
	 u8YTeyy24us/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-5-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-5-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:05:08 +0000
Message-Id: <20260902130509.5C5101F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
>=20
> Use amlogic,meson-axg-i2c as fallback compatible.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D5

