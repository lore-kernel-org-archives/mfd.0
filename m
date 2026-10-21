Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626077;
	b=dG8zhheJFMjhUMhyw61teAOTAVKmg8Tx2eN4x5GAalK1exW+g9cJsQ6bbF1oJD7/P4Fg
	 kR0uH7MNNQE3UTNPO9yXKriT1pvEsGOKdn80QFqLanM8ip60IkbFMTgRUEKvu9WOsuAis
	 b7aOnGYx0luGaJ4YsjMxDywzvCGNivMsQiLWMZVO74NRzlnbAwrh6EGobICHbkJPyNoqv
	 55Bb+7t+mtWBg4qSv+EAxubxqO6FCZqXP46nJqNpLmBUm85q2yA5P+Uip/4qEjHczVDlS
	 knLICErvLqhPyRATNHFHztWRx3QB845bfOjtUIR3/Q+NocnsgQqQa0dpF5f5mtBycDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626077;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=;
	b=vr7JaKDtTPIZPgswazTkT2wPuw25qo5OB3aHcet/VZeo0gTpTK7pjvq1dASW3MDzc8az
	 iDlPlqZ1B1mzw79jK6UGJmWGdC557ZWNi6faSXYetq3OiRXGtzJBzpK+ShYvmRuNUbH6o
	 vyCgEtF5cGT7ujdxlPnxYpBAPU1lJxRb/fuRH0D9hUrLJ9ETRwQlx7Xu5P+M7i3Ewp0tM
	 8ID8DCFW4I+syaTv/GpTHsZcr3NmrPVNSG6Qaz6fWWMsZqVnqWe/VBk7TVU5KUghO7FJv
	 /llvDR8nw+QFpRfTuWkpicAb92W0ofVq/XlHVE5ue9VkZIbvggMVIR4bzLTs8n4arIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D1llVcx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84098606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1llVcx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAEE1F000C8
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 23:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792626077;
	bh=J4DhFTEeDoKbntxLITsLWIvgLd3FXN6aVEqXjdkWZdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1llVcx/Wcx2gxACxf6PGWvV4TKxazaq4Q3KGU6h4AZUmyGDLgr1XhGcuLAN8UDtF
	 ds97t3PfI79HGI/CpZotBeWlUyaPy5sYWX+4YbDhQ6knZLFpLKG0GTdy1hj0kW7QfC
	 zHaCd4xsoKRkjww2W1UASPu8Vpwr3j9QQphByjXjMOm9LeDq46blt1y4eyvPJTfIxl
	 nPPOCcOWt/D5lR77swScRX+J1VQNYhdZddlBq96h846cZ0fTwnGY7ja+x9/BgVgmEY
	 Zf0ctifTnhFFcvOyVY+1kNPzOE0WQ0QAU90vZ1FfunNlrQyobbIHfYIDgddnh95OkA
	 3cp7cfs1mbd/w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1015877e87.3
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 16:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmKJQqCVDQ/af1PyepzXpBhQ1mP1foi8rVmwx6rwsFcNa7aai4s5yU2pGimo4cGm/b9b4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJBhdOTX1pNMp+ibODsZ01gh6YqiQXvyjeGO2AdbqrkuSC6saaR
	bvvTT+TiAZuu/fPO4+RqdTVXYBw1y24vwvrRyJ3OxiplNWSHe5w3vOgKCWHmhyJ6tkuy9K7aluj
	PFtEe9RDwQJjW3u1HOE0YvlKE0BXJZ6g=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:7c40:d086 with SMTP id
 2adb3069b0e04-5bfa1b96422mr1376212e87.8.1792626076140; Wed, 21 Oct 2026
 16:41:16 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021121245.3111563-1-lee@kernel.org> <20261021121245.3111563-23-lee@kernel.org>
In-Reply-To: <20261021121245.3111563-23-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 22 Oct 2026 01:41:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
X-Gm-Features: AclHuK8pfYXRmoE4oCo4fv8YhwqKRNMvuqICl15jr0fU6UsmfMQ7frp0R1kJ7GI
Message-ID: <CAD++jLmLOP+5ef-iLvfzc_7RCD9+qMsRgX4ngD1=tiafBw_3qw@mail.gmail.com>
Subject: Re: [PATCH 23/28] mfd: ab8500-core: Register sysfs attribute groups
 via devm_device_add_group()
To: Lee Jones <lee@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>, 
	Rabin Vincent <rabin.vincent@stericsson.com>, 
	Mattias Wallin <mattias.wallin@stericsson.com>, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Wed, Oct 21, 2026 at 2:16=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> ab8500_probe() registers up to two sysfs attribute groups with
> sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
> second sysfs_create_group() call unconditionally overwrites the return
> value of the first, and if the second call fails, ab8500_probe() returns
> an error without removing the first group.  Because the driver context
> is freed and driver data is cleared on probe failure, reading any leaked
> sysfs attribute dereferences a NULL ab8500 pointer in
> get_register_interruptible().
>
> Register the attribute groups via devm_device_add_group() and only
> register the second group when the first succeeds so that devres
> automatically cleans up registered sysfs attributes on probe failure.
>
> Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8=
540")
> Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a=
333
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Neat, thanks for fixing!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
