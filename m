Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349293;
	b=Jk3NXGAyxpBjrYyAOhaXpgz/wtMR+uADCR6n9XPduYLea6vWTzgCKN19k8gGqEEkzG7d
	 SzAh6oYqo8gkL/a8YK2qFr5gnhbH2xbVKShRuBcDhXzVeXRsSlRJgt0pwprYdknaByk42
	 8735v2eV+pP6PE9MZeJRE9HIBPCLuunUc3vaD+7fwGJLYzSjH5aiI3FDNk3E1WyEmYIcm
	 rZhaye6DtQYx1oDmcHqolUPUzWE+g1+N0RT4xa8ghOfafqjbGbPRIyCiDadHWEWosP4+o
	 1WtPAbtnk77QGLBtUYVXKtz78ii78o/1PFP2/xQp6eEIcJKUmW05FDY4qJpneich2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349293;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	b=08cTs2Ll3nODWQqD0po97ybQE0198jnssUcgCqX3a4dGkqLdX/aDH7gzxct1y/beSJid
	 6b/LdwNISu7GVFWxrfbdxMf86LTo+XxPR3cl9JxlBD5jm3tl5wGEYk7aIuG680FA1kFP4
	 b9cxc+gAqvjAag2ZGs7K+ZU3lE1aKK+Mdw22RDoFKtO+g3iWciVO9G0KJMvvqJLmcs2uK
	 Jo4msGJIpBxXKhqyuRMsXfAd0ueU0P9XjNfxQ8Fi66+Ms37uayKTX/Kem+ftvEaehppZA
	 B2B9aYifiWo7Axin6LSFpLz6+3StCKe8Y/WCBo8pVgAJKoyLPId0jDfuA7QpMRIyQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A5606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZINXWUPL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650681F00A21
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349292;
	bh=VQsxK0ypjps04yXtP7D9Vl+v3TvG2zuYW8obCp7EWXY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZINXWUPL8f7LzBGYW2E2EFIN5YqikTTIb6zwoXh3U6y5TI8TyVghqJOnoO2wsfn36
	 moX34gngLXCKOjeWefU2mX1XvRbWDQtwavmxT0cPBm/KX1wuvozwQlohjO4uD03q1T
	 uI2V+vypbS7nGXA4PT4H+cAxO3NZUAaMdTxdvkxOjKlmHIjFI2TnPW/0/wdwbQZW5j
	 d7KGRB6+Vjvd/v0UuejTd3Lu3zI+3BJqDMtUXig8OO6VM/BJ2YLRVUjIc0IreFrqw5
	 zzbeJ+8dS3RPR4aushFL2zDJmRGC1cKBllkHlI7TGpc5S9FoZ2bv+7oL9sZ6Wf/XCC
	 93y/wQ0ypmeww==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3aae7df0971so3358411fa.1
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 01:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxXv8XITeRspo3/VIbvVMwouo7bdoNWHatpTKy6iASwkZD/JdneVDBARWn18QImQnQX5g=@lists.linux.dev
X-Gm-Message-State: AFq9FYKj7d88rjacOO79UUuTy+5Q73ZAKL7YHP+FM0cYQAXgJsOxE0qx
	mWd8yjBI5P62vcJTzSFl9iHGcj4nhn9ch/n9rMjHV/35vw9CUnFHOcmk26UiXm+3dNK2IyXU9JM
	PwgFS13CHzGPIYSFadseGAkx25l6a19w=
X-Received: by 2002:a2e:be89:0:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3acb7ac0796mr3395761fa.11.1793349290657; Fri, 30 Oct 2026
 01:34:50 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 30 Oct 2026 16:34:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
X-Gm-Features: AclHuK8f9aQow26btBoDKktg4w5d9q6uuVMy592vvuptaUTTeNrSAFWXrHhABVQ
Message-ID: <CAGb2v66Ya50=++STiOLihh6VKtb00QYcv4ARAWqFQ=1FML0Ccw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mfd/ac100.c                   | 2 +-
>  drivers/mfd/axp20x.c                  | 4 ++--

Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
