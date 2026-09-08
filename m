Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19E3D7D67
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906840; cv=none; b=QLSy20TkNukVmA+C5+NrBcWjxBxqYt+w03VMkhqWwf4GksiHM03wI7Z3w3OsQd1PvCrxgSphYJBYQ2JjhfClXkGX1tO2+82lrNG7dncADTeYRM3HNTXnnCx2kMPRFJQd5wuwtXp5ykOSZraA7jVXk4NFvIZmypdPpKBLa6nEFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906840; c=relaxed/simple;
	bh=bGotYtBJRRTEFWmkklWSsKVMCZ8rUNaUONIwTcWcYuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT6FzZAGL56w8ImsV5PultmNM7PthlWNDpbrwUHXP+eSoIxkpF3NzAR6CJbq7SyScjUDx51AGt3QhKnNgVStsmYF4VLF3xx/BCoEmnFZlu0DHVsY8Vi2n0swqhsFg+/ihz3nFjDvVY1V/yLJ8sSI3sh1fXbgdDBp8qzwqK4U+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8ErcXaD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8ErcXaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0971F00A3E
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788906839;
	bh=bGotYtBJRRTEFWmkklWSsKVMCZ8rUNaUONIwTcWcYuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F8ErcXaD3DEFUYDvTL9ykS+ScUf3hsgoic12+mBb9Aynsk90qJnQKuxGL8Y34SUxz
	 1CP+qeOXvANsBOzYuv646yvshlQWF4Z00Mkpr43Xz6lIt0wiEOHLIH9bIUDQNHV4HI
	 Y+9yLCIq2Q8PnQ/YI+YoNs7ynHX9uBqWYhCfQNa3ebdo54dX9RVFjI7NAgDt1wx7hA
	 xtr8RMAVBr0yqBqJyCwSQZuOz5PP8V5FkLvm0h1CyfMm8/D9kzbG5GjJC7qaR4rJPl
	 W51eEhlBU8WOHB9IU2wyH+zPc/K9dYpB58cdtKuOZodL0/Nngs793zPHW60zmRwQ3q
	 BuXSng6E2J9TA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so468593e87.3
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 15:33:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxp5i2zRZbfuey5l4u8dPu/msPCGvB/qXO8zoPdgmNxoQpUH0addBt3u3P0kO5lSwGSwx4=@lists.linux.dev
X-Gm-Message-State: AFuF++kEYNpr8wh1v/z/5OD1yxhzNCP35ky3Ach43gJFpWpIV/vRkH2C
	Zt6LQp3b/Auro4S4DHU3pPrTZ4PuCKPsgVeSPN6rM/DyHS7rC2GVgmvkfSg8h9HAs/7WYs6qA7D
	CmAx48AIW3jWp1QU0C63+3BS0EgZnskM=
X-Received: by 2002:a05:6512:3da8:b0:5b4:ab4b:3fea with SMTP id
 2adb3069b0e04-5b763cedd16mr725336e87.17.1788906837956; Tue, 08 Sep 2026
 15:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 9 Sep 2026 00:33:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFm=BwwYAW4Wmumb53CJeFYzwEAMmcz3OKa2umcR4rQQ@mail.gmail.com>
X-Gm-Features: AcwNN1VtCckGuGpZt-JADvooo6ExABUGUrTc3m9fUTRKXOhxFSG3J53jNFiAgVQ
Message-ID: <CAD++jLmFm=BwwYAW4Wmumb53CJeFYzwEAMmcz3OKa2umcR4rQQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add regulators
To: Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Lee do you think you could ACK this patch so Mark can apply these
changes?

Technically maybe it's mostly regulator stuff and DT binding stuff,
but it'd be nice to have the MFD maintainers blessing.

Yours,
Linus Walleij
