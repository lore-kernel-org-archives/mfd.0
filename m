Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3415734D4CE;
	Mon, 27 Jul 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181608; cv=none; b=LFSQzvtJFs3O7aw/fkQNwPPngy9LPjcE3iUJXiA0zPol8nQhOUol3taeWBjUwJM45KPlmRHAUdd6cZIF4r5KdluaEqG4iGmr240SP6RiugwClabDhua0MkhWVZXS1v/6CAWKqlvSYeOVLVV+FRmQMUZTM1ROOiFdi7DHA6GPuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181608; c=relaxed/simple;
	bh=dC77rrmIXF5PAv/WXHs24kfBnZE7Bir/lS+jlqP9ZR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXYX+xD+Yv1kWwyaBA9iboGyVHshT2zZZ/0ao+yTccuXpaFBA/EpUOAHnehYvFWoO+cdVCsW/9+JfdKzw8QD13rAXzgquOxpCWhB4uO8/maaSpJpv8hZfT/TKuojt6b9fakuuWUwfkr00G9JZPEA9dhgQ/kP23Kllx1JCag33Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvrsIWCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvrsIWCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB791F000E9;
	Mon, 27 Jul 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785181606;
	bh=dC77rrmIXF5PAv/WXHs24kfBnZE7Bir/lS+jlqP9ZR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KvrsIWCD+xlBUPUzVGf+3i5md8Uu9OYkcTpB6PfPxhlww0S8PVlfLHkfbeizABjzM
	 z0E23DS6XMWRPPMzjCi2mqJC3F6G+FlXxnu4rpbvXE+xfAYFZ9yWN7tAnHy+BI3mX8
	 AwvSSQcWvkx3FtOoeibhqdi7wu/L/P7O5ceiMX/i3b6sp9P8dI49e0cXOhwGo7wu+v
	 66xxb2J87jXC5t1IE6aNVtMpyqh0iMuBFmeaY8yix6nVWO3ZrbSKUXfplpyBlfE9ma
	 nbGZhIWKAjbSKLoiI/EIOymSBdO4HoSIqTUEi87pIkakafHpszhqkRzztdke5HPMge
	 4cJdMQaMrSLUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, lee@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260727-zx29clk-v8-10-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-10-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:46:45 +0000
Message-Id: <20260727194645.DFB791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
>=20
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D10

