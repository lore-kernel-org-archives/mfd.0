Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260B2D3733
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411636; cv=none; b=FlcWlnMfzhwo1hwvr9MuKwsbbjj0jwoEv1xS3zR0XmIlzVZ1aaP4qanoSM/ruU2oIAX3qiIofYKfY3MSl8JacW0XI1wUlxcVoxd4taQeAF+YjFg220ByvPEG1ISJXiWPKQ6W7EsSLheV1vk0C9okhV/y+phigZcF5wsgcB7ZNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411636; c=relaxed/simple;
	bh=0onb/3COqcUVjahsVuRBGHGA3Y8K8LvEp2vOYnW3fZo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppQ1bXwdSXEaSGGT7BzFjpOuwvj6pw3xYVXO0DfNJBkkimTZ7g0o6NsUTCKRLl6cYkEGtY6giU0OMFTcMMQ4QxjC8U6Kol/Qnx70Ya/mDOQ6CcP0USZw/PnJJG8CLXeMBd9H8rh6CRKcLb2eorVzGHou8OqPt7zOvkUcj/+7Q48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoJMY+Ht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoJMY+Ht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797411F00A3F
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411635;
	bh=RyAFwPvt0UCPJw5HNHDqE2phbRG8pp+Cebb/gUhycAo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AoJMY+HtiBzCjaO9dyfq9fQ+5jVkaTcn6Q4Ueb1XXAZr9TkDbXwj/6Rv82QHO4lMO
	 jobWO/VqyQSIRlCRnWFfpzdfh9ljCTyLgiR9VdIRtHNX304RY3NEaIe5CAcA849hZw
	 BTMKtjfR+utwSaFV49g261AHQmIzRcLWkDoGuvpOnVJ2P/3Fevc+521t+lUlJcPTVZ
	 4zAJc1C68CFfXxOAok+9b8DuehO+2N3vRbuu3yx3jCGgEcMTx3DHTPvCDBe2VFGj75
	 mV1HkXxir16cqjqTN4BkOCDGAQvnir5ftwNfOALjwzl/kmGuPmz9ZFnTqve5tlXnXx
	 UcO6YEkOJLvgQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso34068101fa.2
        for <mfd@lists.linux.dev>; Tue, 07 Jul 2026 01:07:15 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+yqYpzFbrzcFxBzFRdA4MaRclvfd+9p3soo88ALdyokU4Q3W9
	7fqA3C9WQu8syGUXRcOFv/tPDttjBqGC93H930/pKPHEcz7gNvVT5yeRdBqf1MFHmRMOVMqTRpq
	ceIKJhKEo5syFb2wmadeRb/ZLQPgz22/j543D8zIwhw==
X-Received: by 2002:a05:651c:895:b0:39c:6754:1cab with SMTP id
 38308e7fff4ca-39c67541e26mr5030291fa.5.1783411634141; Tue, 07 Jul 2026
 01:07:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:07:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:07:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
Date: Tue, 7 Jul 2026 01:07:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeK6vMQsHFEyVkmdVessCXXYvEL+=oYqXi3Lb4yhjbh3w@mail.gmail.com>
X-Gm-Features: AVVi8CdUrtZqeiGusTl4bwafoirX7JwcQN2tKR-UvqHU_38IZQh3tXPFy4r1jnQ
Message-ID: <CAMRc=MeK6vMQsHFEyVkmdVessCXXYvEL+=oYqXi3Lb4yhjbh3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mfd: ucb1x00: Convert Assabet gpio-keys to
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 07:01:29 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> This patch series converts the legacy gpio-keys platform device on the
> StrongARM SA-1100 Assabet evaluation board from platform data to software
> nodes and device properties.
>
> The first patch registers a shared software node for the UCB1x00 GPIO
> controller in drivers/mfd/ucb1x00-core.c, attaching its firmware node
> directly to the GPIO chip prior to registration. The second patch
> converts the Assabet machine subdriver to define dynamically allocated
> software nodes referencing the UCB1x00 GPIO controller directly, allowing
> pin bindings to be resolved via the attached firmware node without relying
> on name matching.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Changes in v2:
> - Export ucb1x00_gpiochip_node to fix link errors when built as module.
> - Fix teardown order in core driver to avoid software node use-after-free.
> - Convert Assabet subdriver to use dynamically allocated software nodes
>   to avoid use-after-free on module unload.
> - Factor out button node removal logic into a helper.
> - Link to v1: https://patch.msgid.link/20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com
>
> ---
> Dmitry Torokhov (2):
>       mfd: ucb1x00: Register software node for GPIO controller
>       mfd: ucb1x00: Convert Assabet gpio-keys to use software nodes
>
>  drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
>  drivers/mfd/ucb1x00-core.c    |  16 +++++-
>  include/linux/mfd/ucb1x00.h   |   3 +
>  3 files changed, 116 insertions(+), 27 deletions(-)
> ---
> base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
> change-id: 20260705-ucb1x00-assabet-swnode-683cb383d398
>
> Thanks.
>
> --
> Dmitry
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
