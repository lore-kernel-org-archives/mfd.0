Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06A3B83FB;
	Thu, 17 Sep 2026 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632184; cv=none; b=t40jr7U/fO1o1X4/JcY3e69wv6H/xSx4di3NrFjxCUBy0KalImzZ7fUKlg71aBwSV8IJ37nndwcpdKyvHj17Rdcy8qmHoxHiLZ9Vv/kxMAQwj1eGemW+0vu4Dqz6trLK1A/sqXhT7kFgkz1yT5aiqFLnWyQI1Ru714Y02L8Dgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632184; c=relaxed/simple;
	bh=ZlFX6GelQIinsFXpTfI6KjNrtNTvj73kGqZgHZK3U3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLkLonVFIpQ2OKwyscqj5C5y30QRmX9XjbMYsuGsOSIm5drJbvcbkGRC8w9+hXfor/iF9v6CINYik7rHHB5IwkEmd+8UAdGU98miaq9Bw3cuvjwffZeeR/wxQacyMLTiRaDUmAYDmx6v3MTavrKuRMHgTx4V2DRj7kZqYfTILUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2LkboOw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2LkboOw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE8B1F000FF;
	Thu, 17 Sep 2026 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632183;
	bh=ZlFX6GelQIinsFXpTfI6KjNrtNTvj73kGqZgHZK3U3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2LkboOwwYh5GahcClbDH57vrPTfotCR90jFKUL5rxBNZuxHtrQGCx3H7sLmVvYZh
	 tASnR57Ypl96IVWgWzpARo+aw7xKa6EqlBE0jMxNunGCCIcLSBXtAOTu89u55DrHJc
	 ys7aP71B4GgiXGIsL9tve706aBNcllGl1MpOXTGmiaRlVe+SQ0TKNAZ8XLyGiBCS6Q
	 G+peCueFqTSvqYEHbJHNtadFxeZffh8i5FJEttN858K/ZE8xot7aPF36SgcDhPvJ4V
	 +1EBERwvq8qkPpe7S+kTR36IkiY5+FUdjBBznfzhlAwQDkiEMA5yih2ukZQ0oyfN1T
	 rK+utb531tIog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-5-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-5-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:03:01 +0000
Message-Id: <20260917080302.7CE8B1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D5

