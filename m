Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565085;
	b=2eqMQ/jO6ghtGtmolg0KCPZ0Lq+qkd8+V5PgK2NF5Yubz3VecY2tgO73Xo/vLVlyCcm9
	 ucVeqpezKq+Im6U65ULuUQzdOAD0y8je9j0FUUCEQ+mudVlgibtwE7CfzVDij5FCz1SW9
	 TEnVjRJ5dg5vS4DlB24DmwQty0/yBY65zEsW8sFv+1xN8n93+9i/aiHP4JXI01ENznWnL
	 ftEsALfOSvqbLyNpG4OiGJWs5LEc3yg2qYPUnAim+BgoOeJZxLcM1bEWCP6a23i3Y6l4E
	 XURJp0x01bSXG/3+BrmBcENksxKmZPgY/zP0JHxMUCjWF3VM/hAsKjem30toQqAi+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565085;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oWpj+fMcU0ldZMemXXF2GwJUPPqvOroaTzblSr6zsuI=;
	b=x+LSk4U0FhOeLpJf+gwrl1pT9kaNmuVZ4vE053/UzKNz0xbYXqzXz69Gv8zjyfsPQGz8
	 I54ace//iUNA5/8chU6HOM0vRxzB2VjLPnl5kIcgh/YyFsUpkIlWsm5lLv2Up5lSo9phX
	 4F21CkHRrTc0H1fD+VX3P6r43jdDnn78GYJaSJl3uuGgB9qhW5YYFYEtn/up/Hmili0s5
	 1i3SVOx+KmnCnuoZwJG26RlzxDXwkzaRHm0P44mGW8J7Vw2bTrCdViX/wGkKBwbHii3+p
	 4pQT/KuToJ/5geEtdClkF3+qefXfDUuxBL/1VJiC1Me7C+uFgdSewaSNpl0eAbSmf4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qh7eaR3m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E2606A321
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qh7eaR3m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE84B1F000C4
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565084;
	bh=oWpj+fMcU0ldZMemXXF2GwJUPPqvOroaTzblSr6zsuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qh7eaR3mKL/KtpLKgrkYS9K+6dQOEJpZBEUDnt//WDGrk5Id3GM50FoNbQ8fhBn5L
	 92XO4UVO8tvxi3aqDMLTs2YhCxGcoQIIiFTCciZH9oE8KaHbDxtgR9Uh8FgbiE9wwo
	 CeYQ+HJ3k+ILOSnvat9n1e7hUGFQncLPzCZu1ab2OKmhoLf/IbOyocO7mkbqxwrRlz
	 V4IbnQxnbHQrxmZYh8oyn1b/ZYYQH2LxhVzku/WQb64ZCijhaKl7OleFmZzYIOGovG
	 H6kHUMxFbvH75aIn0rxXcFYusN5NJanO2wZTupcSL1iO3Vk5pUeoA7G5XERe11wTxH
	 m45l4nGo7wukg==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-717080a2d50so1192079eaf.0
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 02:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESOhV7rxjnXY7ZbxiEzvp3l+ARPw3oB8xz79FJIsUu+hDnYLnxB2Ux+x2jCWmXSESb/+Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z8klC05ui8xIoQr9lvlFJz4/AmAqmkzQ0ZS96ry4hCmlWYmcHLU
	qji6AQQUPd5v1oXYnPZ87u2flXxOn1zuamxFAvGByiJQ/aBGPRGZiTbrBCa6G++/wPZy3g/M756
	JBOkkh1DXQ09tHrudxvPnNtTMGSRjNxE=
X-Received: by 2002:a05:6820:2228:b0:70a:1787:2696 with SMTP id
 006d021491bc7-71ab50522aamr1246436eaf.61.1794565084106; Fri, 13 Nov 2026
 02:18:04 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com> <20261022-add-board-ok3572-c-v1-8-0b0fd85a31ee@qq.com>
In-Reply-To: <20261022-add-board-ok3572-c-v1-8-0b0fd85a31ee@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:17:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJsYtjKOF7wpiUqSLoBuiOe+C5sMEQo7XZ1dW773+pJQ@mail.gmail.com>
X-Gm-Features: AclHuK9FczXasoO8qxg9IxepytTJahNxlbbuShGYzvO1iLyvCzMkO5H7q2dWjZE
Message-ID: <CAD++jLkJsYtjKOF7wpiUqSLoBuiOe+C5sMEQo7XZ1dW773+pJQ@mail.gmail.com>
Subject: Re: [PATCH 08/27] pinctrl: rockchip: Add RK3572 support
To: 1579567540@qq.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Wu <david.wu@rock-chips.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:12=E2=80=AFPM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:

> From: Cunhao Lu <1579567540@qq.com>
>
> Support RK3572 pinmux, bias, drive-strength, and Schmitt controls.
> Enable input buffers during mux changes for the RGMII receive clocks.
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

This patch 8/27 applied to the pinctrl tree.

Yours,
Linus Walleij
