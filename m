Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387B2E764D
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411981; cv=none; b=bnd1sQjTxTuWjTQFlbB9SAKdflSVjLEi9F165lY3M9MsyiwnhCr6w7wyYAlwxwvfj/vQ+h3UTL0wJBw4lK3Oy1w6TamkWG/urdrsaJ3ddl/SfCgI+dZUjFGpzQgnP3rWsokbSe5giwCNJVABUX+mnLSDKNt9cC2Lwk/MWxWavaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411981; c=relaxed/simple;
	bh=3bKt6vyFpJ6w/Ja/JvVZ4l0VpvYj9gzjc2vc0I7bIRM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCgffqQ8apYmMAmyQmfYwG3M59t5kjgQxn3Cl4TRuM3P3B2YXN1CT3cm9A6JI+8rgRgaUp8aIpptm+gbpDYGOOKJBkc/X3FjG6EogGDpFSN+i97COmCbkZDgdu0cjpyu01KM3SF/+FXyPmIAYphU337PqUu5NNOWYKrjTicx9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJaJOOAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJaJOOAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5B71F00A3E
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411980;
	bh=n4JUvhNkSmuhcuwopifg013Ulr9xKBdVjIzq1/ArWVw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FJaJOOAuLSorOq1XPh3lqWIJdO+gMpl/efbGNqo9KhZjA1nRx0C0ZH7SDudzrw0ZV
	 ieRTyJfWLPEnihXNbs+1EW6C11ZBWCL2oOYEZcNqxOBcmEw/dvRsrSTDjmXQvGvqMA
	 pBTov5JvFtwwBGm5JzqgdQx6LG5quCgjo8knwRgM8SMM4VUh3SEowHtXIQLpDGAhiP
	 qyrhccUQTzTCnaW4/CZrENMRaxJwYww0nhIfvVtWKitA84C073QIuBT/69r0cHk/sX
	 Zpdh0GVBNMVBY/Wtmk/4o/T3zCNV/+9oO2ESthI5oXygNE6wk+VfhbyVg/MKW+k9xd
	 Hqt2D50844v4g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebf162770so297020e87.1
        for <mfd@lists.linux.dev>; Tue, 07 Jul 2026 01:13:00 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzi7uJk55N+l8yKmkFX1zT/st2RBxdGGS7QShTuWxMNUsxaE+bw
	vZigbSA6hbHDMLy99qJ2jBHhLx5rmjlUF8a15kqFrLfDuAXYcAcR4KvkWwwrr+/VYIjKj5Crv5U
	zxQlYArO7ylf/W0uiarFaljyOJHGtw8gI8wtdODJmHw==
X-Received: by 2002:a05:6512:3a87:b0:5ae:ba20:9772 with SMTP id
 2adb3069b0e04-5b00aca2ad4mr392723e87.23.1783411979113; Tue, 07 Jul 2026
 01:12:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:12:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:12:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
Date: Tue, 7 Jul 2026 01:12:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf5bdHzbNm2fj+TL7a+Gk3SAJc-V_qpaqtM0geaVzU4Xg@mail.gmail.com>
X-Gm-Features: AVVi8CftMSRifwObZGeQDXdGId3IsHbJV5ohlizOE7WF06fw_8qqaaYAd9_dwrc
Message-ID: <CAMRc=Mf5bdHzbNm2fj+TL7a+Gk3SAJc-V_qpaqtM0geaVzU4Xg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mfd: ucb1x00: convert Assabet gpio-keys to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 01:08:03 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts the legacy gpio-keys platform device on the
> StrongARM SA-1100 Assabet evaluation board from platform data to static
> software nodes and device properties.
>
> The first patch registers a shared software node for the UCB1x00 GPIO
> controller in drivers/mfd/ucb1x00-core.c, attaching its firmware node
> directly to the GPIO chip prior to registration. The second patch
> converts the Assabet machine subdriver to define static software nodes
> referencing the UCB1x00 GPIO controller directly, allowing pin bindings
> to be resolved via the attached firmware node without relying on name
> matching.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Dmitry Torokhov (2):
>       mfd: ucb1x00: register software node for GPIO controller
>       mfd: ucb1x00: convert Assabet gpio-keys to use software nodes
>
>  drivers/mfd/ucb1x00-assabet.c | 88 ++++++++++++++++++++++++++++++++-----------
>  drivers/mfd/ucb1x00-core.c    | 12 ++++++
>  include/linux/mfd/ucb1x00.h   |  3 ++
>  3 files changed, 81 insertions(+), 22 deletions(-)
> ---
> base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
> change-id: 20260705-ucb1x00-assabet-swnode-683cb383d398
>
> Thanks.
>
> --
> Dmitry
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
