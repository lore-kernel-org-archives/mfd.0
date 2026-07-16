Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B341F7D7;
	Thu, 16 Jul 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207170; cv=none; b=UBPwqQQm11/aIlQoBhK/FOukKrTgZC2yTy1AACBSgugHd3jRp5Xc0+EZgcNget7lpp+Ydw2KNf0a78UUSuWivehSQ4MJYSJzI2RA0K8X649oGDtDsGf65fuQNztUK/ZHha9x0CLxjbNe6CUON6b9mew3ldrM3pvFoZtGZWNmc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207170; c=relaxed/simple;
	bh=B+UlaSBjgfAlh/xpf3CC0GbXsMdYHPFms+b/2zFVzRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/GHk83Qm2bqTL4hCZ3BTIDiopLmtwTjGE8OycvxG7Vt5htOkjYzHdP47VXdASduE4pivhX2XyszMiwxMmgE7p3Kw4xBjWWfUS1GC0NHPJlOlHnRYxjxam0gc8Xx60dp7BzDTqQDeSid0WCsIqYu5GCGa+StNmPLRSZ+fl+4Sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYN2qED0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYN2qED0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9071F000E9;
	Thu, 16 Jul 2026 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784207168;
	bh=6wtd0MSHvfL7umpVcFFIWf3rRyHx8+pRGAQlyWrp8cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYN2qED0IKWxlDt1X5BiJ9OAm+/KqX0cZ4gQej4rl/ruICS++gyDfxMZ2oNq+2KjP
	 e/ol+calvcjK4HMbZpKbjPNHySGI6sjrPEp0I1IP3i7+UMscNuxvz9Brt90KpzLc8C
	 j7gcl7havwzOIe5mllddBoXRGk/5fj/cNzNDugux3TWCGT/VMQ7gFIjYGkdGn2S4o0
	 HCNO3lcQI+n002YizGnIBarV5y+SzggV1CvAAKme8ncPLO2F2cLP98CqYYH1Jt9Bvj
	 Ignlp89KSzC6rlLtTcqs0rOrSPRDFoTcJA5J23FCN6w0cS7GBWmqZghxMiN17jRlAK
	 tBKKqdvtYkmZA==
Date: Thu, 16 Jul 2026 14:06:04 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use
 software nodes
Message-ID: <20260716130604.GI1260374@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>

On Mon, 06 Jul 2026, Dmitry Torokhov wrote:

> Convert the legacy gpio-keys platform device on the StrongARM SA-1100
> Assabet evaluation board to use software nodes and device properties.
> This allows describing the buttons and their GPIO bindings via software
> nodes so that platform data support can eventually be removed from the
> gpio-keys driver.
> 
> Define static software nodes for the gpio-keys device and the six button
> child nodes at file scope using relative pin indexing on the UCB1x00 GPIO
> controller node. In ucb1x00_assabet_add(), register the software node
> group and use platform_device_register_full() to register the device.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 98 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
> index 6a389737c615..ee49ac779d1a 100644
> --- a/drivers/mfd/ucb1x00-assabet.c
> +++ b/drivers/mfd/ucb1x00-assabet.c
> @@ -6,15 +6,18 @@
>   *
>   *  We handle the machine-specific bits of the UCB1x00 driver here.
>   */
> -#include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/fs.h>
> -#include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
> +#include <linux/init.h>
>  #include <linux/input.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/proc_fs.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
>  #include <linux/mfd/ucb1x00.h>

Should 'linux/mfd/ucb1x00.h' be sorted alphabetically along with the other
header inclusions (e.g. placed before 'linux/module.h')?

>  
>  #define UCB1X00_ATTR(name,input)\
> @@ -34,50 +37,119 @@ UCB1X00_ATTR(vbatt, UCB_ADC_INP_AD1);
>  UCB1X00_ATTR(vcharger, UCB_ADC_INP_AD0);
>  UCB1X00_ATTR(batt_temp, UCB_ADC_INP_AD2);
>  
> +static const struct property_entry ucb1x00_gpio_keys_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "ucb1x00"),
> +	PROPERTY_ENTRY_U32("poll-interval", 50),
> +	{ }
> +};
> +
> +#define UCB1X00_BTN_PROPS(_idx)						\
> +struct property_entry ucb1x00_btn##_idx##_props[] = {			\
> +	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
> +	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\

Where is 'ucb1x00_gpiochip_node' defined or declared? Should we add an 'extern'
declaration or include the relevant header to prevent build errors?

> +			    _idx, GPIO_ACTIVE_HIGH),			\
> +	PROPERTY_ENTRY_STRING("label", "btn" #_idx),			\
> +	PROPERTY_ENTRY_BOOL("linux,can-disable"),			\
> +	{ }								\
> +}
> +
> +static const UCB1X00_BTN_PROPS(0);
> +static const UCB1X00_BTN_PROPS(1);
> +static const UCB1X00_BTN_PROPS(2);
> +static const UCB1X00_BTN_PROPS(3);
> +static const UCB1X00_BTN_PROPS(4);
> +static const UCB1X00_BTN_PROPS(5);
> +
> +static const struct property_entry * const ucb1x00_btn_props[] = {
> +	ucb1x00_btn0_props,
> +	ucb1x00_btn1_props,
> +	ucb1x00_btn2_props,
> +	ucb1x00_btn3_props,
> +	ucb1x00_btn4_props,
> +	ucb1x00_btn5_props,
> +};
> +
> +struct ucb1x00_assabet_priv {
> +	struct platform_device *pdev;
> +	struct fwnode_handle *keys_node;
> +	struct fwnode_handle *button_nodes[ARRAY_SIZE(ucb1x00_btn_props)];
> +};
> +
> +static void ucb1x00_assabet_remove_nodes(struct ucb1x00_assabet_priv *priv, int n)
> +{
> +	while (--n >= 0)
> +		fwnode_remove_software_node(priv->button_nodes[n]);
> +
> +	fwnode_remove_software_node(priv->keys_node);
> +}
> +
>  static int ucb1x00_assabet_add(struct ucb1x00_dev *dev)
>  {
>  	struct ucb1x00 *ucb = dev->ucb;
> -	struct platform_device *pdev;
> -	struct gpio_keys_platform_data keys;
> -	static struct gpio_keys_button buttons[6];
> -	unsigned i;
> -
> -	memset(buttons, 0, sizeof(buttons));
> -	memset(&keys, 0, sizeof(keys));
> -
> -	for (i = 0; i < ARRAY_SIZE(buttons); i++) {
> -		buttons[i].code = BTN_0 + i;
> -		buttons[i].gpio = ucb->gpio.base + i;
> -		buttons[i].type = EV_KEY;
> -		buttons[i].can_disable = true;
> +	struct platform_device_info pdevinfo = {
> +		.name = "gpio-keys",
> +		.id = PLATFORM_DEVID_NONE,
> +		.parent = &ucb->dev,
> +	};
> +	int ret;
> +	int i;

Nit: If you re-work this, please declare inside the if ().

> +
> +	struct ucb1x00_assabet_priv *priv;
> +
> +	priv = kzalloc_obj(*priv, GFP_KERNEL);

Why _obj() here instead of the usual candidates?

What about devm_*?

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->keys_node = fwnode_create_software_node(ucb1x00_gpio_keys_props, NULL);
> +	if (IS_ERR(priv->keys_node)) {
> +		ret = PTR_ERR(priv->keys_node);
> +		goto err_free_priv;
>  	}
>  
> -	keys.buttons = buttons;
> -	keys.nbuttons = ARRAY_SIZE(buttons);
> -	keys.poll_interval = 50;
> -	keys.name = "ucb1x00";
> +	for (i = 0; i < ARRAY_SIZE(ucb1x00_btn_props); i++) {
> +		priv->button_nodes[i] = fwnode_create_software_node(ucb1x00_btn_props[i],
> +								    priv->keys_node);
> +		if (IS_ERR(priv->button_nodes[i])) {
> +			ret = PTR_ERR(priv->button_nodes[i]);
> +			goto err_free_buttons;
> +		}
> +	}
> +
> +	pdevinfo.fwnode = priv->keys_node;
>  
> -	pdev = platform_device_register_data(&ucb->dev, "gpio-keys", -1,
> -		&keys, sizeof(keys));
> +	priv->pdev = platform_device_register_full(&pdevinfo);
> +	ret = PTR_ERR_OR_ZERO(priv->pdev);
> +	if (ret)
> +		goto err_free_buttons;
>  
>  	device_create_file(&ucb->dev, &dev_attr_vbatt);
>  	device_create_file(&ucb->dev, &dev_attr_vcharger);
>  	device_create_file(&ucb->dev, &dev_attr_batt_temp);
>  
> -	dev->priv = pdev;
> +	dev->priv = priv;
>  	return 0;
> +
> +err_free_buttons:
> +	ucb1x00_assabet_remove_nodes(priv, i);
> +err_free_priv:
> +	kfree(priv);
> +	return ret;
>  }
>  
>  static void ucb1x00_assabet_remove(struct ucb1x00_dev *dev)
>  {
> -	struct platform_device *pdev = dev->priv;
> +	struct ucb1x00_assabet_priv *priv = dev->priv;
>  
> -	if (!IS_ERR(pdev))
> -		platform_device_unregister(pdev);
> +	if (!IS_ERR(priv->pdev))
> +		platform_device_unregister(priv->pdev);
> +
> +	ucb1x00_assabet_remove_nodes(priv, ARRAY_SIZE(priv->button_nodes));
>  
>  	device_remove_file(&dev->ucb->dev, &dev_attr_batt_temp);
>  	device_remove_file(&dev->ucb->dev, &dev_attr_vcharger);
>  	device_remove_file(&dev->ucb->dev, &dev_attr_vbatt);
> +
> +	kfree(priv);
>  }
>  
>  static struct ucb1x00_driver ucb1x00_assabet_driver = {
> 
> -- 
> 2.55.0.rc2.803.g1fd1e6609c-goog
> 

-- 
Lee Jones
