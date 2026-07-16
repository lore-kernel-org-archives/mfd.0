Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F028A72F
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214946; cv=none; b=WUqs6A0jWDk/z6bYbJeY+qGOyXRgPve2TN2m8ufJkT6To2wkUpYtPbGI5tezrTAn66sK45rpZA1nIa7zAo1GZQZaiL4o47ud2HpYUw7w+gbXJLO8xClztOlUigahSgsHPkiKMo4dIoMuS9v8tIjdYt/SPDN+4ZaD3s6T3Q/do6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214946; c=relaxed/simple;
	bh=4YYMMqaPZIQVBZdoilTjZIEz6KIMQ+dp4dax5kgRYEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNJ87m+zItKUdQYBYYxDzeBTlh/Iacg1bqobNZisK3XU2n6qbWxrPoWvKCewgtJhizmwHnIa9pXtcFV3iHIhONNSimmUo314Po4cYWXs5xBCCXhYmG3BQEGzWVtnQ28BgyDQIZSOZT6Ho6EbMlBIqQ+C8h6IiDvrmmIzik8xrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSxMpHaB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSxMpHaB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848761b5897so3590712b3a.3
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214944; x=1784819744; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCC5n/6RJx6zfC06djCwlTGF+cPbC4cvu5Xj0HQOjYA=;
        b=HSxMpHaB8LE0C46hfB9Bsk9uzEBKLcdG5/ENCa7oZYYwfp5Sk5mPRnu2n3T6dA4R1Y
         epv+yB75tV46FjcooxkWPE8W1Pivh9PEhCyL8A/H6OwW/jMs3qrnmJ7hY93O3YknegN6
         aXn3fDccAN18oHqDiziqyeq50Q8mEA9G+1EEyPJddXDBdcUNG0qtvLfxLrjiw/Lc0f3O
         mtIGqVaBpca12VrYKl4av9yNo4MtYR7ke5bcAV+YM0LtZLbLLdA/W6UI6Phh9NqWp0+3
         9E7dPMVaieNjDZUKcf4OqW+hJ/kU8vEhXeVN0a8eZdqJKWZBK/bBYvPOWq66MnOn8s8d
         fXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214944; x=1784819744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCC5n/6RJx6zfC06djCwlTGF+cPbC4cvu5Xj0HQOjYA=;
        b=h2SGslo8mT/KwaVZj1TeTHTbpcmE9L29om++jBsUJKXUGlhuv8OWOug14fzuBbFI/K
         ML9Q1YskDav6zda6gyrptIcv2andQaZgunTYUP/vNxLIIRh0DFDkA4iBLqaIaBkMv+Ap
         U3vtNwHmCKZGmODMQiUHAV8pVR2hJmi1gYSMs1cQq0j/fs1349Cx/mksfatflzR/Is+g
         nRhi67NIun1dR0vIPuIsZ7INIBnmDWlrYGdWS2ZjkdynBv0RoFyAwKEhxVZPmFUOy7i5
         8lpVrYzqj/v3MQjKgNGfgRakRsgvAtjDeV+xRajrKVtRNtVcAryLfotjqT7Oo6OUl9v7
         PWZw==
X-Forwarded-Encrypted: i=1; AHgh+Roq6qAuruJrXlVzuo2EjTCoaCvFPlz8E2sS6FwUHpz3Z/bYaBDZKxi0nzRNq8VZ6Q+5Gmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlxuKoP0diXQ2akb36BVjrJEMLCNCaf5nehnhuMVXjxd4DkcTO
	f7v1kB0sKfkhr+gXq0brmpL45k0l7uD5WenJ/eVgIsHsjg6ffAFCXb9G
X-Gm-Gg: AfdE7cm2KyKIrCkquhtxcgI6J2JNoHlX/g2xEWPGe7L9E+ayH+/aej1MWLprueqIWvB
	600cqFWr7WKqQzRVT/RUXLb4/UReQfH4Zf8w72r+EneYgCuQBr2KIEzsZi2QdmdTQRv5pDg4huC
	5oj/HVP3utx1kVwwwW0QGIMIhIC2nrg+d50H0hoLOdzj0xUt5dxzmktz8Cdn3KXAJE+0jMEK1Ea
	zg0EGsVTdXaVx3gBHCNxgKD5dtAzwsdmOZ49F65a7X7jAYk5P81pABxihhQqZ+jrGRI6z7U9Z8k
	D00PuePJyE2QqzTBng1nQw/QDIolRAxrdIifJq+hSK9DnegddsNEi9qlSK5eX6LKCOMBp6DypeU
	hh0XTIuQk2I/c7PWfee+eJwEEtgM7V1ZjfLosTyT/QfgkzgBaZhW72HConqNgoKEEaPXODcrTPQ
	F2B3u3r1FoMiQ6EyjXcrLMVd67OJiY/gAcxDGKvhdl4LE+3aWsDvwo/Q==
X-Received: by 2002:a05:6a00:190e:b0:847:8971:87bb with SMTP id d2e1a72fcca58-84a5562dd41mr10877424b3a.21.1784214944451;
        Thu, 16 Jul 2026 08:15:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:38ea:b937:53f6:928c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2778acsm5042438b3a.20.2026.07.16.08.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:15:43 -0700 (PDT)
Date: Thu, 16 Jul 2026 08:15:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use
 software nodes
Message-ID: <aljznJ3Vg69a0V59@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
 <20260716130604.GI1260374@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716130604.GI1260374@google.com>

On Thu, Jul 16, 2026 at 02:06:04PM +0100, Lee Jones wrote:
> On Mon, 06 Jul 2026, Dmitry Torokhov wrote:
> 
> > Convert the legacy gpio-keys platform device on the StrongARM SA-1100
> > Assabet evaluation board to use software nodes and device properties.
> > This allows describing the buttons and their GPIO bindings via software
> > nodes so that platform data support can eventually be removed from the
> > gpio-keys driver.
> > 
> > Define static software nodes for the gpio-keys device and the six button
> > child nodes at file scope using relative pin indexing on the UCB1x00 GPIO
> > controller node. In ucb1x00_assabet_add(), register the software node
> > group and use platform_device_register_full() to register the device.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
> >  1 file changed, 98 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
> > index 6a389737c615..ee49ac779d1a 100644
> > --- a/drivers/mfd/ucb1x00-assabet.c
> > +++ b/drivers/mfd/ucb1x00-assabet.c
> > @@ -6,15 +6,18 @@
> >   *
> >   *  We handle the machine-specific bits of the UCB1x00 driver here.
> >   */
> > -#include <linux/module.h>
> > -#include <linux/init.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/fs.h>
> > -#include <linux/gpio_keys.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/gpio/property.h>
> > +#include <linux/init.h>
> >  #include <linux/input.h>
> > +#include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/proc_fs.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> >  #include <linux/mfd/ucb1x00.h>
> 
> Should 'linux/mfd/ucb1x00.h' be sorted alphabetically along with the other
> header inclusions (e.g. placed before 'linux/module.h')?

Maybe, but I did not add it here...

> 
> >  
> >  #define UCB1X00_ATTR(name,input)\
> > @@ -34,50 +37,119 @@ UCB1X00_ATTR(vbatt, UCB_ADC_INP_AD1);
> >  UCB1X00_ATTR(vcharger, UCB_ADC_INP_AD0);
> >  UCB1X00_ATTR(batt_temp, UCB_ADC_INP_AD2);
> >  
> > +static const struct property_entry ucb1x00_gpio_keys_props[] = {
> > +	PROPERTY_ENTRY_STRING("label", "ucb1x00"),
> > +	PROPERTY_ENTRY_U32("poll-interval", 50),
> > +	{ }
> > +};
> > +
> > +#define UCB1X00_BTN_PROPS(_idx)						\
> > +struct property_entry ucb1x00_btn##_idx##_props[] = {			\
> > +	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
> > +	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\
> 
> Where is 'ucb1x00_gpiochip_node' defined or declared? Should we add an 'extern'
> declaration or include the relevant header to prevent build errors?

We did. It is introduced in the previous patch and is declared in
linux/mfd/ucb1x00.h

> 
> > +			    _idx, GPIO_ACTIVE_HIGH),			\
> > +	PROPERTY_ENTRY_STRING("label", "btn" #_idx),			\
> > +	PROPERTY_ENTRY_BOOL("linux,can-disable"),			\
> > +	{ }								\
> > +}
> > +
> > +static const UCB1X00_BTN_PROPS(0);
> > +static const UCB1X00_BTN_PROPS(1);
> > +static const UCB1X00_BTN_PROPS(2);
> > +static const UCB1X00_BTN_PROPS(3);
> > +static const UCB1X00_BTN_PROPS(4);
> > +static const UCB1X00_BTN_PROPS(5);
> > +
> > +static const struct property_entry * const ucb1x00_btn_props[] = {
> > +	ucb1x00_btn0_props,
> > +	ucb1x00_btn1_props,
> > +	ucb1x00_btn2_props,
> > +	ucb1x00_btn3_props,
> > +	ucb1x00_btn4_props,
> > +	ucb1x00_btn5_props,
> > +};
> > +
> > +struct ucb1x00_assabet_priv {
> > +	struct platform_device *pdev;
> > +	struct fwnode_handle *keys_node;
> > +	struct fwnode_handle *button_nodes[ARRAY_SIZE(ucb1x00_btn_props)];
> > +};
> > +
> > +static void ucb1x00_assabet_remove_nodes(struct ucb1x00_assabet_priv *priv, int n)
> > +{
> > +	while (--n >= 0)
> > +		fwnode_remove_software_node(priv->button_nodes[n]);
> > +
> > +	fwnode_remove_software_node(priv->keys_node);
> > +}
> > +
> >  static int ucb1x00_assabet_add(struct ucb1x00_dev *dev)
> >  {
> >  	struct ucb1x00 *ucb = dev->ucb;
> > -	struct platform_device *pdev;
> > -	struct gpio_keys_platform_data keys;
> > -	static struct gpio_keys_button buttons[6];
> > -	unsigned i;
> > -
> > -	memset(buttons, 0, sizeof(buttons));
> > -	memset(&keys, 0, sizeof(keys));
> > -
> > -	for (i = 0; i < ARRAY_SIZE(buttons); i++) {
> > -		buttons[i].code = BTN_0 + i;
> > -		buttons[i].gpio = ucb->gpio.base + i;
> > -		buttons[i].type = EV_KEY;
> > -		buttons[i].can_disable = true;
> > +	struct platform_device_info pdevinfo = {
> > +		.name = "gpio-keys",
> > +		.id = PLATFORM_DEVID_NONE,
> > +		.parent = &ucb->dev,
> > +	};
> > +	int ret;
> > +	int i;
> 
> Nit: If you re-work this, please declare inside the if ().

You man inside "for ()"?

> 
> > +
> > +	struct ucb1x00_assabet_priv *priv;
> > +
> > +	priv = kzalloc_obj(*priv, GFP_KERNEL);
> 
> Why _obj() here instead of the usual candidates?
> 
> What about devm_*?

This is not a driver in the sense of device core driver, so devm would
not work.

Thanks.

-- 
Dmitry
